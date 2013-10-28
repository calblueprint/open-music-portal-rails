class Admin < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_admins
  belongs_to :resource, :polymorphic => true

  scopify
end
