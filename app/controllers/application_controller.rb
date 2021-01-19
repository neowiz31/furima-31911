class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configre_permitted_parameters, if: :devise_controller?

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:birthday, :nickname, :last_name, :first_name, :last_name_furigana, :first_name_furigana])
  end

end
