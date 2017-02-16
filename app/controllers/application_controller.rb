class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  protected
  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  def authenticate_admin_user
    authenticate_user!
    redirect_to(admin_dashboard_path) && return if current_user.admin?
  end


end
