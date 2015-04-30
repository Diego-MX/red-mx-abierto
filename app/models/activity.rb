class Activity < ActiveRecord::Base
  belongs_to :step

  has_many :user_activities, dependent: :destroy
  has_many :users, through: :user_activities
  has_many :activity_tools
  has_many :tools, through: :activity_tools

  after_create :add_activity_to_user

  default_scope { order(:created_at) }

  private

  def add_activity_to_user
    User.all.each do |u|
      self.user_activities.create(user: u)
    end
  end
end
