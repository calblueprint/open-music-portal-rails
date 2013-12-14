# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

USOMC::Application.load_tasks

desc "Assign the events equally across all days without caring about conflicts"
task default_scheduler: :environment do
  @competition = Competition.find(1)
  events = @competition.events
  days = @competition.days
  events.each_with_index do |event, index|
    index = index % days.length
    days[index].events << event
    puts "Adding #{event.name} to day: #{day.name}"
  end
end
