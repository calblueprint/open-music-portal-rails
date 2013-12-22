# == Schema Information
#
# Table name: competitions
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  year       :integer
#  location   :string(255)
#  venue      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  is_current :boolean
#

require 'spec_helper'

describe Competition do
  pending "add some examples to (or delete) #{__FILE__}"
end
