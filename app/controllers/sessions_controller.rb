class SessionsController < ApplicationController
  skip_before_action :authorize

# 中身は無いが、ログインフォームを表示する為必要
  def new
  end

# ログインフォームからの受付
  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "無効なユーザ／ パスワードの組み合わせです"
    end
  end

# ログアウト処理
  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "ログアウトしました"
  end
end
