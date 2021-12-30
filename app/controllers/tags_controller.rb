class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @hash = @tags.inject({}) {|org, tag| org.merge({"#{tag.posts.size}" => tag})}
    @tag_list = []
    @hash.keys.map(&:to_i).sort.reverse.each do |h|
      @tag_list << @hash["#{h}"]
    end
  end

  def show
    tags = TagList.where(tag_id: params[:id]).pluck(:post_id)
    @posts = Post.find(tags)
    @tag = Tag.find(params[:id])
  end
end
