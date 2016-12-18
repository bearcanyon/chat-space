class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  def after_sign_in_path_for(resource)
  	# messages_path
    groups_path
  end
  def after_sign_out_path_for(resource)
  	edit_user_registration_path
  end
end
# サインインした後に飛ばすデバイスが用意したaftersignin
