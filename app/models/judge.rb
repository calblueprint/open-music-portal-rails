# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  id_number              :integer
#  date_of_birth          :date
#  email                  :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  password_digest        :string(255)
#  country                :string(255)
#  street_address         :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  zip_code               :string(255)
#  phone_number           :string(255)
#  remember_token         :string(255)
#  password_reset_token   :string(255)
#  password_reset_sent_at :datetime
#  confirmed              :boolean          default(FALSE)
#  confirmation_token     :string(255)
#

class Judge < User
  has_and_belongs_to_many :users, :join_table => :users_judges
  belongs_to :resource, :polymorphic => true

  scopify

  def self.all
    User.with_role(:judge)
  end

end
