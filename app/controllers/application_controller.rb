class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  protected
  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = 'You are not authorized to access this resource!'
      redirect_to root_path
    end
  end
end
