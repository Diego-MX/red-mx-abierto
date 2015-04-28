module Devise
  class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :set_values

    def new
      @user = User.new
    end
    
    def create
      if conditions_accepted?
            type_of_officer
              @user = User.new(user_params) 
              if @user.save 
                redirect_to root_path,  notice:  I18n.t('messages.user_create') 
              else
                render :new
              end
      end
  end

  private

  def user_params
    params.require(:user).permit(:email,   :password, :password_confirmation, :government_type, :state, :municipality, :deputation, :dependency_name, :full_name, :accept)
  end

  def conditions_accepted?
    params[:accept].each do |key, value|
      if value == '1' 
      @acepted = true 
    else
      @acepted = false 
    end
    end 
    return  !params[:user].nil?
    end

  def set_values
    @deputations= ['Alvaro Obregon' ,  'Azcapotzalco','Benito Juarez', 'Cuajuimalpa', 'Coyoacan', 'Cuahutemoc', 'Gustavo A Madero', 'Iztacalco',
      'Iztapalapa', 'Magdalena Contreras', 'Miguel Hidalgo', 'Milpa Alta', 'Tlahuac', 'Tlalpan', 'Venustiano Carranza', 'Xochimilco']

      @states= ['Aguascalientes','Baja California Norte', 'Baja California Sur ','Campeche ','Chiapas ','Chihuahua', 'Coahuila','Colima ', 'Durango', 'Guanajuato', 
        'Guerrero  ', 'Hidalgo ','Guadalajara','Edo. México ','Michoacán ','Morelos ','Nayarit','Monterrey','Oaxaca', 'Puebla ','Querétaro', 'Quintana Roo', 
        'San Luís Potosí', 'Sinaloa ', 'Sonora ', 'Tabasco',  'Tamaulipas', 'Tlaxcala ', 'Veracruz', 'Yucatán ', 'Zacatecas', 'Distrito Federal' ]
  end

      def type_of_officer
        @type_government = params[:user][:government_type]
        if @type_government  == 'delegacion'
          @delegacional_cheked = true
        elsif @type_government  == 'municipal'
          @municional_cheked = true
        elsif @type_government  == 'estatal'
          @estatal_cheked = true
        end
      end
end
end