class MembersController < ApplicationController
 helper_method :type_of_members
 layout 'devise'

 def index
  set_user_filter
end


  private
    def type_of_members
      ShowMembers.type_of_members
    end

    def set_user_filter
      unless params[:post].nil?
        type = params[:post][:government_type]
        if type == 'Delegacional'
          @user = User.where(government_type: 'delegacion')
        elsif type == 'Municipal'
          @user = User.where(government_type: 'municipal')
        elsif type == 'Estatal'
          @user = User.where(government_type: 'estatal')
        else
          @user = User.all
        end#termina if
      else
        @user = User.all
      end#termina unless
    end#termina def
  end

