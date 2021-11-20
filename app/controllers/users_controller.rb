class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.order(id: "DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User was successfully updated"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_valid: false)
    reset_session
    flash[:notice] = "ご利用ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :user_name, :user_content, :user_photo)
  end
end
