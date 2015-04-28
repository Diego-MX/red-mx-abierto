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

  def deputation_is_blank?
    deputation.nil? || deputation.blank?
  end

  def state_is_blank?
    return state.nil? || state.blank?
  end
end

