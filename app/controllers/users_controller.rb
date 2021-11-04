class UsersController < ApplicationController
  def show
  end

  def index
    @post = Post.all
  end

end
