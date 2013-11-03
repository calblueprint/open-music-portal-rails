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

# Creating users
u = User.create(first_name: "Howard", last_name: "Chen", email: "howard@howard.com",
                country: "USA", street_address: "101 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "11111", phone_number: "1111111111",
                date_of_birth: Date.today - 1.year,
                password: "password", password_confirmation: "password")

u.add_role :contestant

a = User.create(first_name: "Howie", last_name: "Cheng", email: "how@ie.com",
                country: "USA", street_address: "102 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "22222", phone_number: "2222222222",
                date_of_birth: Date.today - 2.years,
                password: "password", password_confirmation: "password")

a.add_role :admin

j = User.create(first_name: "How", last_name: "Word", email: "how@word.com",
                country: "USA", street_address: "69 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "90909", phone_number: "6969696969",
                date_of_birth: Date.today - 3.years,
                password: "password", password_confirmation: "password")

j.add_role :judge

b  = User.create(first_name: "Mark", last_name: "Sama", email: "mark@mark.com",
                country: "USA", street_address: "69 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "90909", phone_number: "6969696969",
                date_of_birth: Date.today - 3.years,
                password: "password", password_confirmation: "password")

c  = User.create(first_name: "Marky", last_name: "Mark", email: "marky@marky.com",
                country: "USA", street_address: "69 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "90909", phone_number: "6969696969",
                date_of_birth: Date.today - 3.years,
                password: "password", password_confirmation: "password")

d  = User.create(first_name: "Mark", last_name: "Dono", email: "mark@dono.com",
                country: "USA", street_address: "69 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "90909", phone_number: "6969696969",
                date_of_birth: Date.today - 3.years,
                password: "password", password_confirmation: "password")

e  = User.create(first_name: "Mark", last_name: "Kun", email: "mark@kun.com",
                country: "USA", street_address: "69 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "90909", phone_number: "6969696969",
                date_of_birth: Date.today - 3.years,
                password: "password", password_confirmation: "password")

f  = User.create(first_name: "Mark", last_name: "Chan", email: "mark@Chan.com",
                country: "USA", street_address: "69 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "90909", phone_number: "6969696969",
                date_of_birth: Date.today - 3.years,
                password: "password", password_confirmation: "password")

g  = User.create(first_name: "Mighty", last_name: "Mark", email: "Mighty@Mark.com",
                country: "USA", street_address: "69 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "90909", phone_number: "6969696969",
                date_of_birth: Date.today - 3.years,
                password: "password", password_confirmation: "password")

h  = User.create(first_name: "Mark", last_name: "Miyashta", email: "mark@swag.com",
                country: "USA", street_address: "69 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "90909", phone_number: "6969696969",
                date_of_birth: Date.today - 3.years,
                password: "password", password_confirmation: "password")

i  = User.create(first_name: "i", last_name: "j", email: "mark@yoloswag.com",
                country: "USA", street_address: "69 Swole St.", city: "Berkeley",
                state: "CA", zip_code: "90909", phone_number: "6969696969",
                date_of_birth: Date.today - 3.years,
                password: "password", password_confirmation: "password")

