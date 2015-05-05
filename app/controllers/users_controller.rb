class UsersController < ApplicationController
  layout 'admin'
  before_action :set_user, only: [:edit, :update]

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to edit_user_path(current_user), notice: I18n.t('users.notices.saved_successfully')
    else
      redirect_to edit_user_path(current_user), alert: I18n.t('users.alerts.save_failed')
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :dependency_name)
  end
end
