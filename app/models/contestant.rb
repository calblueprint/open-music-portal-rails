# == Schema Information
#
# Table name: contestants
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  resource_id   :integer
#  resource_type :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class Contestant < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_contestants
  belongs_to :resource, :polymorphic => true
  
  scopify
end
