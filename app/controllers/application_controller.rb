class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_match

  protected
  def current_match
    @current_match = Match.last
  end

  def is_admin?
    player_signed_in? ? current_player.is_admin : false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :username, :email, :password, :password_confirmation)
    end
  end
end
