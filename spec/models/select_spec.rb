# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog, "Blogモデルのテスト", type: :model do
  let(:blog) { build(:blog) }

  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      blog.title = ''
      expect(blog).to be_invalid
      expect(blog.errors[:title]).to include("を入力してください")
    end
    it "contentが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      blog.content = ''
      expect(blog).to be_invalid
      expect(blog.errors[:content]).to include("を入力してください")
    end
  end
end
