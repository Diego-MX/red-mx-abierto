class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :dependency_name, :message => 'Debes escribir el nombre de la dependencia', on:  :create
  validates_length_of :dependency_name, :minimum => 10, :message => 'El nombre de la dependencia debe tener por lo menos 3 caracteres.', on:  :create

  validates_presence_of :full_name, :message => "Tu nombre  no puede estar en blanco.", on:  :create
  validates_length_of :full_name, :minimum => 10, :message => 'Tu nombre debe tener por lo menos 3 caracteres.', on:  :create
  validates_format_of :full_name, :with => /\A[a-zA-Z áéíóúÁÉÍÓÚñÑ]+\z/, :message => "El nombre solo debe tener letras.", on:  :create

  validates_presence_of :state ,  :message => "Indica tu Estado",  if: :deputation_is_blank?
  validates_presence_of :municipality ,  :message => "Indica tu municipio", if: :deputation_is_blank_and_state_is_fill?
  validates_presence_of :deputation ,  :message => "Indica tu delegación", if: :state_is_blank?

  def deputation_is_blank?
    deputation.nil? || deputation.blank?
  end

  def deputation_is_blank_and_state_is_fill?
    deputation.nil? || deputation.blank? && !state.nil? && !state.empty?
  end

  def state_is_blank?
    return state.nil? || state.blank?
  end
end

