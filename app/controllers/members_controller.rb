class MembersController < ApplicationController
 helper_method :type_of_members
 before_action :set_user_filter, only: :index
 layout 'devise'

 def index
 end


  private
    def type_of_members
      ShowMembers.type_of_members
    end

    def set_user_filter
      @user = User.all
      unless params[:post].nil?
        @type = params[:post][:government_type]
        if @type == 'Delegacional'
          @user = User.where(government_type: 'delegacion')
        elsif @type == 'Municipal'
          @user = User.where(government_type: 'municipal')
        elsif @type == 'Estatal'
          @user = User.where(government_type: 'estatal')
        end
      end
    end

  end

