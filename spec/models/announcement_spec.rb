# == Schema Information
#
# Table name: announcements
#
#  id          :integer          not null, primary key
#  description :text
#  admin_id    :integer
#  date        :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Announcement do
  pending "add some examples to (or delete) #{__FILE__}"
end
