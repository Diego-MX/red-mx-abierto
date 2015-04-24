class Activity < ActiveRecord::Base
  belongs_to :step

  has_many :user_activities
  has_many :users, through: :user_activities

  after_create :add_activity_to_user

  private

  def add_activity_to_user
    Users.all.each do |u|
      self.user_activities.create(user: u)
    end
  end
end
