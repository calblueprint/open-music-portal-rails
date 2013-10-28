# == Schema Information
#
# Table name: pieces
#
#  id             :integer          not null, primary key
#  composer_id    :integer
#  nationality_id :integer
#  title          :text
#  book_id        :integer
#  publisher_id   :integer
#  affiliate_link :text
#  length_minutes :integer
#  length_seconds :integer
#  period_id      :integer
#  pages          :text
#  level_id       :integer
#  other_a        :text
#  other_b        :text
#  other_c        :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Piece < ActiveRecord::Base
  resourcify
  belongs_to :composer
  belongs_to :nationality
  belongs_to :book
  belongs_to :publisher
  belongs_to :period
  belongs_to :level
  has_and_belongs_to_many :events

  validates :title, presence: true
  validates_associated :composer, :nationality, :book, :publisher, :period, :level

end
