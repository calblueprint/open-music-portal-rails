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

require 'spec_helper'

describe Piece do
  pending "add some examples to (or delete) #{__FILE__}"
end
