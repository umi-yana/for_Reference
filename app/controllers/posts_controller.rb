class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post_new = Post.new
    @posts = Post.all.order(id: "DESC") 
  end

  def show
    @post = Post.find(params[:id])
  end
  

  def create
    @posts = Post.new(post_params)
    @posts.user_id = current_user.id
    if @posts.save
      flash[:success] = "投稿しました"
      redirect_to posts_path
    else
      flash[:error] = "エラーが発生しました。"
      render :index
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "編集しました"
      redirect_to posts_path(@post.id)
    else
      flash[:error] = "エラーが発生しました。"
      render :edit
    end

  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:success] = '削除成功しました。'
      redirect_to posts_url
    else
      flash[:error] = '削除できません'
      render :edit
    end
  end
  

private
def post_params
  params.require(:post).permit(:user_id, :post_body,:select_a,:select_b,:post_image )
end

end
