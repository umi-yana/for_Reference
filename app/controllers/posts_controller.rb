class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post_new = Post.new
    @posts = Post.all.order(id: "DESC") 
    @select_count_a = PostSelect.where(is_select: "A")
    @tag_list = Tag.all.order(id: "DESC") 
  end

  def show
    @post = Post.find(params[:id])
    @comment =Comment.new
    @comments = @post.comments.all.order(id: "DESC") 
    @post_tags = @post.tags 
  end


  def create
    @posts = Post.new(post_params)
    @posts.user_id = current_user.id
    tag_list = params[:post][:tag_name].split("#")
    if @posts.save
      @posts.save_tag(tag_list)
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
    @post.destroy
    redirect_to posts_path
  end
  

private
def post_params
  params.require(:post).permit(:user_id, :post_body,:select_a,:select_b,:post_image )
end

end
