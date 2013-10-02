require 'csv'

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
