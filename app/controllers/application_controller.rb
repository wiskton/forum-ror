class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def access_denied(exception)
    flash[:alert] = "Unauthorized Access!"
    redirect_to admin_dashboard_path
  end

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.is_admin? or current_user.is_moderator?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
