require 'csv'

if Piece.count < 2000
  num_created = 0
  num_total = 0

  CSV.foreach(
      'db/seeds/db.csv',
      :headers => true,
      :converters => lambda {|f| f ? f.strip : nil}
    ) do |row|

    row_period = row[0]
    row_nationality = row[1]
    row_level = row[2]
    row_composer = row[3]
    row_title = row[4]
    row_book = row[5]
    row_time = row[7]

    time = Float(row_time) rescue nil
    time_min = Integer(time) rescue nil
    time_sec = Integer(time.modulo(1) * 60) rescue nil

    # default time
    if not time_min and not time_sec
      time_min = 3
      time_sec = 0
    end

    composer = row_composer ? Composer.where(:name => row_composer).first_or_create : nil
    nationality = row_nationality ? Nationality.where(:name => row_nationality).first_or_create : nil
    book = row_book ? Book.where(:name => row_book).first_or_create : nil
    level = row_level ? Level.where(:name => row_level).first_or_create : nil
    period = row_period ? Period.where(:name => row_period).first_or_create : nil

    # in the given data, it seems that composer+title+book+level are enough to distinguish
    not_already_exists = Piece.where(
      :title => row_title,
      :composer_id => composer ? composer.id : nil,
      :book_id => book ? book.id : nil,
      :level_id => level ? level.id : nil
    ).blank?

    if not_already_exists
      Piece.create(
        composer: composer,
        nationality: nationality,
        title: row_title,
        book: book,
        publisher: nil,
        affiliate_link: nil,
        length_minutes: time_min,
        length_seconds: time_sec,
        period: period,
        pages: nil,
        level: level,
        other_a: nil,
        other_b: nil,
        other_c: nil
      )
      num_created += 1
    else
      puts "Ignoring entry with title: #{row_title}"
    end
    num_total += 1

  end

  puts "Entries created: #{num_created}. Total: #{num_total}."
end

# Create announcements
descriptions = {
  Date.new(2013, 7, 11) => "2015 Registration has opened! Sign up now for a discounted entry fee.",
  Date.new(2013, 6, 9)  => "2015 Judges Application Available. Apply here to get involved.",
  Date.new(2013, 4, 20) => "Mark Miyashita is not pronounced the way you think it is.",
  Date.new(2013, 1, 3)  => "Blah blah blahhhh blah blah blah blah blah blah",
  Date.new(2012, 3, 7)  => "But what about blah blah blah?"
}

descriptions.each do |date, description|
  Announcement.where(date: date, description: description).first_or_create
end

# Create a sample competition
competition = Competition.where(name: "Spring 2014").first_or_create

# Make days
(10..15).each do |day_number|
  new_day = Day.where(date: Date.parse("2014-02-#{day_number}"), competition_id: competition.id).first_or_create
  puts "Created new day: #{new_day.date.strftime('%a %d %b %Y')}"
end

# Creating users
user_params = {
  country: "USA",
  street_address: "1 Main St.",
  city: "Berkeley",
  state: "CA",
  zip_code: "11111",
  phone_number: "111-111-1111",
  date_of_birth: Date.today - 10.years,
  password: "password",
  password_confirmation: "password"
}

users = {
  "contestant" => [
    ["Howard", "Chen", "howard@howard.com"],
    ["Joe", "Schmo", "joe@schmo.com"],
    ["John", "Doe", "john@doe.com"],
    ["John", "Hoe", "john@hoe.com"],
    ["George", "Washington", "jwash@ington.com"],
  ],
  "admin" => [
    ["How", "Word", "how@ie.com"],
    ["Mark", "Mark", "mark@mark.com"],
  ],
  "judge" => [
    ["How", "Word", "how@word.com"],
    ["Judge", "Judy", "judge@judy.com"],
    ["Will", "Tang", "will@will.com"],
  ]
}

users.each do |user_type, list_of_users|
  list_of_users.each do |user|
    new_user_params = user_params.merge({first_name: user[0], last_name: user[1], email: user[2]})
    new_user = User.create(new_user_params)
    new_user.add_role user_type
    puts "Created new user with type #{user_type}: #{new_user.first_name} #{new_user.last_name} with email #{new_user.email}."
  end
end

room_numbers = [
  "101",
  "102",
  "103",
  "104",
]

room_numbers.each do |room_number|
  new_room = Room.where(name: room_number).first_or_create
  puts "Created room: #{new_room.name}."
end

# Create events
display_events = [
  "Cool test event",
  "Not cool test event",
  "Test event for kids",
  "Test event for teens",
  "Piano - 11-15",
  "Violin - 8-9",
  "The fun event",
  "Super not fun event",
]

pieces = Piece.where("id < 10")
display_event_users = User.with_role(:contestant).where("user_id < 20")
judges = User.with_role(:judge).where("user_id < 10")
room = Room.where(name: "101").first

display_events.each do |display_event|
  new_event = DisplayEvent.where(name: display_event, num_pieces: 1, max_time: 120).first_or_create
  new_event.pieces += pieces
  new_event.add_contestants(display_event_users)

  event = new_event.events.first
  event.users += judges
  event.room = room
  puts "Created display event: #{new_event.name} with #{new_event.pieces.count} pieces and #{event.contestants.count} contestants and #{event.judges.count} in room #{event.room.name}."
end

# Create categories
categories = [
  ['Open Solo', nil],
  ['The Treasury of Baroque Composers', nil],
  ['The Treasury of Classical Composers', nil],
  ['The Treasury of Romantic Composers', nil],
  ['The Treasury of Impressionist Composers', nil],
]

categories.each_with_index do |category, index|
  new_category = Category.where(name: category[0], age_limit: category[1]).first_or_create
  new_category.display_events += [DisplayEvent.find(index % DisplayEvent.count + 1)]
  puts "Created category: #{new_category.name} with #{new_category.display_events.count} display events."
end

# Create comments
comments = [
  'Great job!',
  'Needs improvement',
  'Play slower',
  'Great work!',
]

event = Event.first
contestants = User.with_role(:contestant).limit(comments.length)
judge = User.with_role(:judge).first
comments.each_with_index do |comment, index|
  contestant = contestants[index]
  new_comment = Comment.where(event_id: event.id, contestant_id: contestant.id, judge_id: judge.id, body: comment).first_or_create
  puts "Created comment: #{new_comment.body} for contestant: #{contestant.id} by judge: #{judge.id} for event: #{event.id}."
end
