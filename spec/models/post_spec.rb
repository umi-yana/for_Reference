require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "正常系" do
    context "回答する" do
      it "正しく回答できる" do
        post_new = Post.new(
          post_body:'hello',
          select_a:'test',
          select_b:'edit'
        )
        expect(post_new).to be_valid
      end
    end
  end
end
