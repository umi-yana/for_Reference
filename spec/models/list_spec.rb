# frozen_string_literal: true

require 'rails_helper'

Rspec.describe 'モデルのテスト', type: :model do
  describe "a specification" do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:list)).to be_valid
    end
  end
end