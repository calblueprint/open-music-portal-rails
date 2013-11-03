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

class Announcement < ActiveRecord::Base
end
