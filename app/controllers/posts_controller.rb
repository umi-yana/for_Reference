class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @post = Post.new
    @posts = Post.includes(:user, :comments, :post_selects, :tags).order(id: "DESC").page(params[:page]).per(20)
    @tag_list = Tag.includes(:post).all.order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.all.order(id: "DESC")
    @post_tags = @post.tags
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.score = Language.get_data(post_params[:post_body])
    tag_list = params[:post][:tag_name].split("#")
    if @post.save
      @post.save_tag(tag_list)
      @posts = Post.includes(:user, :comments, :post_selects).order(id: "DESC").page(params[:page]).per(20)
      @tag_list = Tag.includes(:post).all.order(id: "DESC")
      # redirect_to posts_path
    else
      @posts = Post.includes(:user, :comments, :post_selects).order(id: "DESC").page(params[:page]).per(20)
      @tag_list = Tag.includes(:post).all.order(id: "DESC")
      render "error"
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

  def ranking
    @all_ranks_user = User.find(Post.group(:user_id).order(Arel.sql('count(user_id) desc')).limit(5).pluck(:user_id))
    # 投稿者(user)の中で投稿（post）したユーザー番号（user_id)が多いものを3位までピックアップ
    @all_ranks_tag = Tag.find(TagList.group(:tag_id).order(Arel.sql('count(tag_id) desc')).limit(5).pluck(:tag_id))
    # タグ(tag)の中でタグ一覧(taglist)追加されたタグ番号(tag_id）が多いものを3位までピックアップする
    @all_ranks_select = Post.find(Favorite.group(:post_id).order(Arel.sql('count(post_id) desc')).limit(5).pluck(:post_id))
    # 投稿(post)の中でコメント(comment)されたPost_id(被投稿ページ）が多いものを3位までピックアップする
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :post_body, :select_a, :select_b, :post_image)
  end
end
