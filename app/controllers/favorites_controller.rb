class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
    favorite.destroy
  end

  def show
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorites_list = Post.find(favorites)
  end
end
