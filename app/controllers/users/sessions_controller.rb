class Users::SessionsController < ApplicationController
  def new_guest
    user = User.guest
    sign_in user   # ユーザーをログインさせる
    redirect_to about_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
