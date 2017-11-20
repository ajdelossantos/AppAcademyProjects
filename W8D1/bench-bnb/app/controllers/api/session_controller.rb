class Api::SessionController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      sign_in!(@user)
      # redirect
    else
      flash.now[:errors] = ['Invalid credentials']
      # re-render
    end
  end

  def destroy
    sign_out!
    # redirect
  end
end
