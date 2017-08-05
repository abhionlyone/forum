class MyAccountController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to :back, notice: 'Your interests were saved.' }
      else
        format.html { redirect_to :back, error: 'Something went wrong' }
      end
    end
  end

  protected

  def user_params
    params.require(:user).permit(:tags => [])
  end

end
