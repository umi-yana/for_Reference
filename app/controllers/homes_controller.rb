class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]
  def unsubscribe
    
  end

  def withdraw
    @user = current_user
    @user.update(is_valid: true)
    reset_session
    flash[:notice] = "ご利用ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end
end
