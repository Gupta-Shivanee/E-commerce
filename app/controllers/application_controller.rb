class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_out_path_for(_resource)
    root_path
  end
  
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :gender, :mobile_no, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :mobile_no, :image])
  end
end
