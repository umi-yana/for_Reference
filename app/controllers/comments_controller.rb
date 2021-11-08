class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.post_id = @post.id
    if @comment.save(comment_params)
      redirect_to post_path(@post)
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
