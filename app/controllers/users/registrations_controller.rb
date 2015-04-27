class Users::RegistrationsController < Devise::RegistrationsController
before_filter :set_values

   def new
    @user = User.new
  end
  
  def create
    unless params[:user].nil?
        tipo_funcionario
    end 
    @user = User.new(user_params) 
    if @user.save 
      redirect_to new_user_registration_path,  alert:  "Usuario ya existe"
    else
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email,   :password, :password_confirmation, :government_type, :state, :municipality, :deputation, :dependency_name, :full_name)
  end

  def set_values
    @deputations= ['Alvaro Obregon' ,  'Azcapotzalco','Benito Juarez', 'Cuajuimalpa', 'Coyoacan', 'Cuahutemoc', 'Gustavo A Madero', 'Iztacalco',
    'Iztapalapa', 'Magdalena Contreras', 'Miguel Hidalgo', 'Milpa Alta', 'Tlahuac', 'Tlalpan', 'Venustiano Carranza', 'Xochimilco']

    @states= ['Aguascalientes','Baja California Norte', 'Baja California Sur ','Campeche ','Chiapas ','Chihuahua', 'Coahuila','Colima ', 'Durango', 'Guanajuato', 
      'Guerrero  ', 'Hidalgo ','Guadalajara','Edo. México ','Michoacán ','Morelos ','Nayarit','Monterrey','Oaxaca', 'Puebla ','Querétaro', 'Quintana Roo', 
      'San Luís Potosí', 'Sinaloa ', 'Sonora ', 'Tabasco',  'Tamaulipas', 'Tlaxcala ', 'Veracruz', 'Yucatán ', 'Zacatecas', 'Distrito Federal' ]
  end



  def tipo_funcionario
    if params[:user][:government_type] == 'delagacion'
      @delegacional_cheked = 'true'
    elsif params[:user][:government_type] == 'municipal'
      @municional_cheked = 'true'
    elsif params[:user][:government_type] == 'estatal'
      @estatal_cheked = 'true'
    end
  end


  def all_params
  unless params[:user][:password].blank?
     @password = params[:user][:password]
   end
   unless params[:user][:government_type].blank?
     @government_type = params[:user][:government_type]
   end
   unless params[:user][:state].blank?
     @state = params[:user][:state]
   end
   unless params[:user][:municipality].blank?
     @municipality = params[:user][:municipality]
   end
   unless params[:user][:deputation].blank?
    @deputation = params[:user][:deputation]
   end
   unless params[:user][:dependency_name].blank?
     @dependency_name = params[:user][:dependency_name]
   end
   unless params[:user][:full_name].blank?
     @full_name = params[:user][:full_name]
   end
   unless params[:user][:email].blank?
     @email = params[:user][:email]
   end
   if !@password.blank? && !@government_type.blank? && !@dependency_name.blank? && !@full_name.blank? && !@email.blank? 
     return true 
   end
   return false
 end
end
