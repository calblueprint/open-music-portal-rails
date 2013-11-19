# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  amount           :integer          not null
#  charged          :boolean          default(FALSE)
#  charged_at       :datetime
#  stripe_charge_id :text
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe Transaction do
  pending "add some examples to (or delete) #{__FILE__}"
end
