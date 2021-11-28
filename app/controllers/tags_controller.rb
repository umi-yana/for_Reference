class TagsController < ApplicationController
  def index
    @tags = Tag.all
    # @tags => [#<Tag id: 1, tag_name: "aaaaaa", created_at: "2021-11-28 07:17:47", updated_at: "2021-11-28 07:17:47">, #<Tag id: 2, tag_name: "10", created_at: "2021-11-28 08:03:09", updated_at: "2021-11-28 08:03:09">]
    @hash = @tags.inject({}) {|org, tag| org.merge({"#{tag.posts.size}" => tag})}
    # inject =>
    #  h1 = { "a" => 100, "b" => 200 }
    #  h2 = { "b" => 246, "c" => 300 }
    #  h1.merge(h2) #=> {"a"=>100, "b"=>246, "c"=>300}
    #  {"1"=>#<Tag id: 1, tag_name: "aaaaaa", created_at: "2021-11-28 07:17:47", updated_at: "2021-11-28 07:17:47">, "3"=>#<Tag id: 2, tag_name: "10", created_at: "2021-11-28 08:03:09", updated_at: "2021-11-28 08:03:09">}
    @tag_list = []
    @hash.keys.map(&:to_i).sort.reverse.each do |h|
      # keys => ["1", "3"]
      # map(&:to_i) => [1, 3]
      # sort.reverse => [3, 1]
      @tag_list << @hash["#{h}"]
      # [1,2,3] << 4 // [1,2,3,4]
      # h = {"key" => "value"} // h["key"] => "value"
    end
  end

  def show
    tags = TagList.where(params[:id]).pluck(:post_id)
    @posts = Post.find(tags)
  end
end
