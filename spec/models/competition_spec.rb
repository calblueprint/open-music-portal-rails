# == Schema Information
#
# Table name: competitions
#
#  id                           :integer          not null, primary key
#  name                         :string(255)
#  year                         :integer
#  location                     :string(255)
#  venue                        :string(255)
#  created_at                   :datetime
#  updated_at                   :datetime
#  is_current                   :boolean
#  open_date                    :datetime
#  first_late_date              :datetime
#  second_late_date             :datetime
#  close_date                   :datetime
#  closed                       :boolean
#  open_registration_fee        :integer
#  first_late_registration_fee  :integer
#  second_late_registration_fee :integer
#

require 'spec_helper'

describe Competition do
  pending "add some examples to (or delete) #{__FILE__}"
end
