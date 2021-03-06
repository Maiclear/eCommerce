class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: 'No tienes permiso para hacer esa acción.'
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:name, :last_name, :user_name]
      devise_parameter_sanitizer.for(:account_update) << [:name, :last_name, :user_name]
    end

    def require_admin
      authenticate_user!
      redirect_to root_path unless current_user.admin?
    end
end
