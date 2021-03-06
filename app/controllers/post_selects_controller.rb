class PostSelectsController < ApplicationController
  before_action :authenticate_user!
  def create
    post_select = PostSelect.new
    post_select.is_select = params[:is_select]
    post_select.user_id = current_user.id
    post_select.post_id = params[:post_id]
    post_select.save
    @post = post_select.post
  end

  def destroy
    post_select = PostSelect.find(params[:id])
    @post = post_select.post
    post_select.destroy
  end

  def update
    @post_select = PostSelect.find(params[:id])
    @post = @post_select.post
    @post_select.update(is_select: params[:is_select])
  end

  def show_a
    @post = Post.find(params[:post_id])
    @post_selects = PostSelect.where(post_id: params[:post_id]).order(created_at: "DESC")
  end

  def show_b
    @post = Post.find(params[:post_id])
    @post_selects = PostSelect.where(post_id: params[:post_id]).order(created_at: "DESC")
  end
end
