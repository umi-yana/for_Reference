class Users::SessionsController < ApplicationController

  # ----退会機能ーーー
  before_action :reject_user, only: [:create]

  def new_guest
    user = User.guest
    sign_in user   # ユーザーをログインさせる
    redirect_to about_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  protected

  def reject_user
    @user = User.find_by(email: params[:user_name][:email])
    if @user
      if (@user.valid_password?(params[:user_name][:password]) && (@user.active_for_authentication? == true))
        flash[:error] = "退会済みです。"
        redirect_to new_user_session_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
  #------  　@user がfalse または、　パスワードが存在しない場合は新規登録ページに変移させる。ーーーーーーー


end
