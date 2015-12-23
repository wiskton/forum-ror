class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(request.env['omniauth.auth']['info']['email'])
    if !@user
      @user = User.from_omniauth(request.env["omniauth.auth"])
    end
    sign_in_and_redirect @user
  end

  def new
    redirect_to '/auth/facebook'
  end
end
