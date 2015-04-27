class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, :message => 'Debes escribir tu correo.', on:  :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "El correo debe tener un formato válido.", on:  :create

  validates_presence_of :password, :message => 'Debes escribir un password.', on:  :create
  validates_length_of :password, :minimum => 8, :message => 'El password debe tener por lo menos 8 caracteres.', on:  :create

  validates_presence_of :dependency_name, :message => 'Debes escribir el nombre de la dependencia', on:  :create
  validates_length_of :dependency_name, :minimum => 10, :message => 'El nombre de la dependencia debe tener por lo menos 3 caracteres.', on:  :create

  validates_presence_of :full_name, :message => "Tu nombre  no puede estar en blanco.", on:  :create
  validates_length_of :full_name, :minimum => 10, :message => 'Tu nombre debe tener por lo menos 3 caracteres.', on:  :create
  validates_format_of :full_name, :with => /\A[a-zA-Z áéíóúÁÉÍÓÚñÑ]+\z/, :message => "El nombre solo debe tener letras.", on:  :create


end
