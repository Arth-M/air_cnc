class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_in_path_for(user)
  #   root_path
  # end
  private

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :password, :first_name, :last_name, :photo, :phone_number]  )
  devise_parameter_sanitizer.permit(:account_update, keys: [:password, :first_name, :last_name, :photo, :phone_number]  )
  end
end
