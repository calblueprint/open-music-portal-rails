# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  body          :string(255)
#  judge_id      :integer
#  contestant_id :integer
#  event_id      :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end
