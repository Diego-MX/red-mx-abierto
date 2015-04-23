class Activity < ActiveRecord::Base
  belongs_to :step
  has_many :user_activities
  has_many :users, through: :user_activities
end
