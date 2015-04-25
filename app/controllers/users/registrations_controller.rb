class Users::RegistrationsController < Devise::RegistrationsController
    before_filter :update_sanitized_params, if: :devise_controller?



    def update_sanitized_params
       devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email,   :password, :password_confirmation, :government_type, :state, :municipality, :deputation, :dependency_name, :full_name)}
      puts '***********************'
       puts params[:user] [:government_type]
        if params[:user] [:government_type] == 'delagacion'
          @delegacional_cheked = 'true'
        elsif params[:user] [:government_type] == 'municipal'
          @municional_cheked = 'true'
        elsif params[:user] [:government_type] == 'estatal'
          @estatal_cheked = 'true'
        end
    end
end