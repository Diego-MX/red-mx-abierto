class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_activities
  has_many :activities, through: :user_activities

  after_create :add_activities_to_user

  def last_activity
    checked_user_activities = self.user_activities
                                  .where(checked:true)

    # let's check first if there's at least one checked activity
    if checked_user_activities.any?
      # return the last checked activity
      checked_user_activities.includes(:activity)
                             .order('activities.step_id DESC')
                             .first
                             .activity
    else
      # there isn't a checked activity, return the first activity
      self.user_activities
          .order('created_at ASC')
          .first
          .activity
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
