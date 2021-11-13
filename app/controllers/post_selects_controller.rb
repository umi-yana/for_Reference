class PostSelectsController < ApplicationController
  def create
    post_select = PostSelect.new
    post_select.is_select = params[:is_select]
    post_select.user_id = current_user.id
    post_select.post_id = params[:post_id]
    post_select.save
    @post = post_select.post
    # redirect_back(fallback_location: root_path)　非同期処理のためコメントアウト
  end

  def destroy
    post_select = PostSelect.find(params[:id])
    post_select.delete
    redirect_back(fallback_location: root_path)
  end

  def update
    @post_select = PostSelect.find(params[:id])
    @post = @post_select.post
    @post_select.update(is_select: params[:is_select])
    # redirect_back(fallback_location: root_path)　非同期処理のためコメントアウト
  end
end
