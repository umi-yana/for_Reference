
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Color, "Colorモデルのテスト", type: :model do
  let(:color) { build(:color) }

  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      color.title = ''
      expect(color).to be_invalid
      expect(color.errors[:title]).to include("を入力してください")
    end
    it "detailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      color.detail = ''
      expect(color).to be_invalid
      expect(color.errors[:detail]).to include("を入力してください")
    end
    it "evaluationが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      color.evaluation = ''
      expect(color).to be_invalid
      expect(color.errors[:evaluation]).to include("を入力してください")
    end
    it "color_imageが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      color.color_image = ''
      expect(color).to be_invalid
      expect(color.errors[:color_image]).to include("を入力してください")
    end
  end
end