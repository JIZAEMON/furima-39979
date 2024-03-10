class ApplicationController < ActionController::Base

  # BASIC認証の強制
  before_action :basic_auth

  # deviseに対し特定のキーのパラメーターを許可を強制
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン時以外はログインページへ強制的に遷移(トップページのindexアクションを除く)
  before_action :authenticate_user!, only: [:index]

  private

  # BASIC認証
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

  # deviseに対し特定のキーのパラメーターを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname, 
      :first_name, 
      :first_name_kana, 
      :last_name, 
      :last_name_kana, 
      :birthday
    ])
  end

end
