  module Devise
    class Users::RegistrationsController < Devise::RegistrationsController
      helper_method :deputations_options, :states_options

      def new
        @user = User.new
      end
      
      def create
          @user = User.new(user_params) 
          if @user.save 
            redirect_to user_session_path,  notice:  I18n.t('messages.user_create') 
          else
            render :new
          end
      end

      private

      def user_params
        params.require(:user).permit(:email,   :password, :password_confirmation, :government_type, :state, :municipality, :deputation, :dependency_name, :full_name, :accept)
      end


     def deputations_options
      UserRegistrations.deputations_options
    end

    def states_options
      UserRegistrations.states_options
    end
  end
end