class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user! # ログインしていない場合はログイン画面へリダイレクト

  def after_sign_in_path_for(resource)
    root_path # ログイン後にリダイレクトする先
  end

  # 本リリース時にログアウト後の画面遷移を指定したいので残す↓
  # def after_sign_out_path_for(resource_or_scope)
  #   root_path # ログアウト後にリダイレクトする先
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
