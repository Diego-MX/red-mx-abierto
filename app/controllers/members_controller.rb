class MembersController < ApplicationController
   helper_method :type_of_members
      layout 'devise'
  def index
    @user = User.all
  end

  
  private
  def type_of_members
      ShowMembers.type_of_members
    end
end
