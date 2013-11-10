class Comment < ActiveRecord::Base
  belongs_to :judge, class_name: "User"
  belongs_to :contestant, class_name: "User"
  belongs_to :event

  validates_presence_of :body
end
