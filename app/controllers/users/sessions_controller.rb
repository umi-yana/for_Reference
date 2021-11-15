class Users::SessionsController < ApplicationController
  before_action :reject_inactive_user, only: [:create]

  # ----退会機能ーーー
  def reject_inactive_user
    @user = User.find_by(name: params[:user][:name])
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.is_valid
        redirect_to new_user_session_path
      end
    end
  end
  #------  　@user がfalse または、　パスワードが存在しない場合は新規登録ページに変移させる。ーーーーーーー


  
  def new_guest
    user = User.guest
    sign_in user   # ユーザーをログインさせる
    redirect_to about_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
