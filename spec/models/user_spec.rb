# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "Userモデルのテスト", type: :model do
  let(:user) { build(:user) }

  context "空白のバリデーションチェック" do
    it "last_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user.last_name = ''
      expect(user).to be_invalid
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it "first_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user.first_name = ''
      expect(user).to be_invalid
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "phone_numberが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user.phone_number = ''
      expect(user).to be_invalid
      expect(user.errors[:phone_number]).to include("を入力してください")
    end
  end
end