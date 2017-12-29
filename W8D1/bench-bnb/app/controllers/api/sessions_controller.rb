class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      sign_in!(@user)
      render "api/users/show"
    else
      render json: ['Invalid credentials'], status: 401
    end
  end

  def destroy
    # new!
    @user = current_user
    if @user
      sign_out!
      render json: {}
      # render "api/users/show"
    else
      # Render a 404 msg if there is no current_user to logout
      render json: ["No user is signed in"], status: 404
    end
  end
end
