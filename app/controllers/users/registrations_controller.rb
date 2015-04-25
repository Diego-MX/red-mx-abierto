class Users::RegistrationsController < Devise::RegistrationsController
    before_filter :update_sanitized_params, if: :devise_controller?



    def update_sanitized_params
       devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email,   :password, :password_confirmation, :government_type, :state, :municipality, :deputation, :dependency_name, :full_name)}

puts params[:action]
        if params[:user] [:government_type] == 'delagacion'
          @delegacional_cheked = 'true'
        elsif params[:user] [:government_type] == 'municipal'
          @municional_cheked = 'true'
        elsif params[:user] [:government_type] == 'estatal'
          @estatal_cheked = 'true'
        end

        @deputation= ['Alvaro Obregon' ,  'Azcapotzalco','Benito Juarez', 'Cuajuimalpa', 'Coyoacan', 'Cuahutemoc', 'Gustavo A Madero', 'Iztacalco',
          'Iztapalapa', 'Magdalena Contreras', 'Miguel Hidalgo', 'Milpa Alta', 'Tlahuac', 'Tlalpan', 'Venustiano Carranza', 'Xochimilco']
        @states= ['Aguascalientes','Baja California Norte', 'Baja California Sur ','Campeche ','Chiapas ','Chihuahua', 'Coahuila','Colima ', 'Durango', 'Guanajuato', 
                          'Guerrero  ', 'Hidalgo ','Guadalajara','Edo. México ','Michoacán ','Morelos ','Nayarit','Monterrey','Oaxaca', 'Puebla ','Querétaro', 'Quintana Roo', 
                        'San Luís Potosí', 'Sinaloa ', 'Sonora ', 'Tabasco',  'Tamaulipas', 'Tlaxcala ', 'Veracruz', 'Yucatán ', 'Zacatecas', 'Distrito Federal' ]
    end

end