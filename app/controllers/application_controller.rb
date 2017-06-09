class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  devise_group :user, contains: [:client, :designer]
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, :keys => [:first_name, :last_name, :company_id])
    devise_parameter_sanitizer.permit(:account_update, :keys => [:first_name, :last_name, :company_id])
  end
end
