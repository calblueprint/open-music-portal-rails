namespace :scheduling do
  desc 'blah blah'
  task :schedule_events => :environment do
    # Parameters (times are in seconds)
    TIME_BETWEEN_PIECES = 5*60 # 5 minutes
    MAX_CONCURRENT_EVENTS = 10
    MAX_DAY_TIME = 6*60*60 # max 6 hours per day of events
    NUM_DAYS = 5

    # Fetch all data and compute event lengths and scores
    event_total_times = {}
    event_scores = {}
    event_users = {}
    user_events = Hash.new {|hsh, key| hsh[key] = [] }
    Event.all.each do |event|
      piece_time_sum = 0
      num_pieces = 0
      EventsUser.where(event: event).each do |eu|
        piece = Piece.find(eu.piece_id)
        length_minutes = piece.length_minutes ? piece.length_minutes : 0
        length_seconds = piece.length_seconds ? piece.length_seconds : 0
        piece_time_sum += length_minutes*60 + length_seconds
        num_pieces += 1
      end
      if num_pieces == 0
        puts "Warning: Event #{event.id} has 0 players. Skipping."
      else
        event_total_times[event.id] = piece_time_sum + (num_pieces - 1)*TIME_BETWEEN_PIECES
        # TODO: round up event time
        event_scores[event.id] = event_total_times[event.id] + num_pieces
        event_users[event.id] = event.users.pluck(:id).shuffle # random order of users in each event
        event_users[event.id].each do |user_id|
          user_events[user_id] << event.id
        end
      end
    end
    #event_ids = event_total_times.keys
    print event_total_times

    sorted_event_ids = event_scores.keys.sort {|a, b| event_scores[b] <=> event_scores[a]}

    # now allocate events to days in order
    # days[i][j][k] is the kth event of the jth concurrent slot of the ith day
    days = Array.new(NUM_DAYS) { Array.new(MAX_CONCURRENT_EVENTS) { Array.new } }
    # day_lengths[i][j] is the total length of the jth concurrent slot of the ith day
    day_lengths = Array.new(NUM_DAYS) { Array.new(MAX_CONCURRENT_EVENTS, 0) }
    event_starts = {} # stores event => [day, start time]

    curr_day = 0
    curr_day_slot = Array.new(NUM_DAYS, 0)


    sorted_event_ids.each do |event_id|
      # if we used up all the slots for a day, skip that day
      while curr_day < NUM_DAYS and curr_day_slot[curr_day] >= MAX_CONCURRENT_EVENTS
        curr_day += 1
      end
      if curr_day >= NUM_DAYS
        puts 'Not enough time to allocate everyone!'
        exit
      end

      days[curr_day][curr_day_slot[curr_day]] << event_id
      event_starts[event_id] = [curr_day, day_lengths[curr_day][curr_day_slot[curr_day]]]
      day_lengths[curr_day][curr_day_slot[curr_day]] += event_total_times[event_id]

      # if a slot fills on one day, then go to a new slot for that day
      if day_lengths[curr_day][curr_day_slot[curr_day]] >= MAX_DAY_TIME
        curr_day_slot[curr_day] += 1
      end
      # NOTE: this actually could allocate an extra piece to a day.
      # This is fixable but the code is much simpler the way it is now.

      curr_day = (curr_day + 1) % NUM_DAYS;
    end


    puts days


    # Compute and print conflicts
    no_conflicts = true
    user_events.keys do |user_id, event_ids|
      n = event_ids.length
      n.times do |event_1_id|
        (n - event_1_id - 1).times do |j|
          event_2_id = j + 1
          interval_1 = [event_starts[event_1_id], event_starts[event_1_id] + event_total_times[event_1_id]]
          interval_2 = [event_starts[event_2_id], event_starts[event_2_id] + event_total_times[event_2_id]]
          if interval_1[0] > interval_2[0]
            interval_1, interval_2 = interval_2, interval_1
          end
          if interval_1[1] > interval_2[0]
            no_conflicts = false
            puts 'User #{user_id} is in overlapping events #{event_1_id} and #{event_2_id}'
          end
        end
      end
    end
    if no_conflicts
      puts 'No conflicts!'
    end

  end
end
