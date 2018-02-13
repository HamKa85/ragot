class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :sanitize_devise_params, if: :devise_controller?

  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(
        :anonymous_username,
        :email,
        :password,
        :password_confirmation,
        :remember_me,
        :sign_up_code
    ) }
  end
end
