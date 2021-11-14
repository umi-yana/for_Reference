class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.user_name == 'ゲスト'
      # ゲストユーザーならaboutページ
      about_path
    else 
      # それ以外ならpost_indexページ
      posts_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
end
