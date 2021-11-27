class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_id = @post.id
    if comment.save(comment_params)
      @comment = Comment.new
      @comments = @post.comments.all.order(id: "DESC")
      # redirect_to post_path(@post)
    else
      @comment = comment
      render 'error'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.post_id = @post
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
