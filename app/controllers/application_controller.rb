class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # ログインしていなかったら自動でログイン画面へ(deviseのメソッド)
  before_action :authenticate_user!
  # もしdeviseに関わる何かが動いたら下記変数が動く
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters  
    # deviseのメソッド(sign_up時のkey[:name]の許可)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
