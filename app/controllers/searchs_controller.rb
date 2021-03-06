class SearchsController < ApplicationController
  before_action :authenticate_user!

  def search
    @model = params["search"]["model"]
    @value = params["search"]["value"]
    @datas = search_for(@model, @value)
    @tag_post = TagList.where(tag_id: @datas)
  end

  private

  def partical(model, value)
    if model == 'post'
      Post.where("post_body LIKE ?", "%#{value}%")
    elsif model == 'user'
      User.where("user_name LIKE ?", "%#{value}%")
    end
  end

  def search_for(model, value)
    partical(model, value)
  end
end
