class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_activities
  has_many :activities, through: :user_activities

  after_create :add_activities_to_user

  def last_activity
    last_checked_user_activity = self.user_activities.where(checked:true).order(activity_id: :desc).first
    # let's check first if there's at least one checked activity
    if last_checked_user_activity.present?
      # return the last checked activity
      last_checked_user_activity.activity
    else
      # there isn't a checked activity, return the first activity
      self.user_activities.order(activity_id: :asc).first.activity
    end
  end

  def first_log_in?
    self.sign_in_count == 1
  end

  private

  def add_activities_to_user
    Activity.all.each do |a|
      self.user_activities.create(activity: a)
    end
  end
end
