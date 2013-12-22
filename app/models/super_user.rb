class SuperUser < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_super_users
  belongs_to :resource, :polymorphic => true

  scopify

  def self.all
    User.with_role(:super_user)
  end

end
