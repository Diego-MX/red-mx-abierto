class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :dependency_name, :message => I18n.t('user.validation.dependency_name_empty') , on:  :create
  validates_length_of :dependency_name, :minimum => 10, :message => I18n.t('user.validation.dependency_name_length'), on:  :create

  validates_presence_of :full_name, :message => I18n.t('user.validation.dependency_name_empty'), on:  :create
  validates_length_of :full_name, :minimum => 10, :message => I18n.t('user.validation.full_name_length'), on:  :create
  validates_format_of :full_name, :with => /\A[a-zA-Z áéíóúÁÉÍÓÚñÑ]+\z/, :message => I18n.t('user.validation.full_name_format'), on:  :create

  validates_presence_of :government_type ,  :message => I18n.t('user.validation.government_type_empty')
  validates_presence_of :state ,  :message => I18n.t('user.validation.state_empty'),  if: :deputation_is_blank?
  validates_presence_of :deputation ,  :message => I18n.t('user.validation.deputation_empty'), if: :state_is_blank?

  has_many :user_activities
  has_many :activities, through: :user_activities

  after_create :add_activities_to_user

  def deputation_is_blank?
    deputation.nil? || deputation.blank?
  end

  def state_is_blank?
    return state.nil? || state.blank?
  end

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
