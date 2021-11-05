class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.order(id: "DESC") 
  end

  def index
    @post = Post.all
  end


  def edit
    @user = User.find(params[:id])
    
  end
  
end
