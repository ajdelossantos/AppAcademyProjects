class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      sign_in!(@user)
      # redirect
    else
      flash.now[:errors] = @user.error.full_messages
      # re-render
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
