class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post_new = Post.new
    @posts = Post.all
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
  

private
def post_params
  params.require(:post).permit(:user_id, :post_body,:select_a,:select_b,:post_image )
end

end
