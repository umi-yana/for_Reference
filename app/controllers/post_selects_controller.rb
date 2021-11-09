class PostSelectsController < ApplicationController
  def create
    @post = PostSelect.new
    @post.is_select = params[:is_select]
    @post.user_id = current_user.id
    @post.post_id = params[:post_id]
    @post.save
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    post_select = PostSelect.find(params[:id])
    post_select.delete
  end

  def update
    @post_select = PostSelect.find(params[:id])
    @post = @post_select.post
    @post_select.update(is_select: params[:is_select])
    # redirect_back(fallback_location: root_path)
  end
end
