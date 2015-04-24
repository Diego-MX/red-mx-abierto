class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_activities
  has_many :activities, through: :user_activities

  after_create :add_activities_to_user

  private

  def add_activities_to_user
    Activity.all.each do |a|
      self.user_activities.create(activity: a)
    end
  end
end
