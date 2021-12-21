
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, "Contactモデルのテスト", type: :model do
  let(:contact) { build(:contact) }

  context "空白のバリデーションチェック" do
    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      contact.name = ''
      expect(contact).to be_invalid
      expect(contact.errors[:name]).to include("を入力してください")
    end
    it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      contact.email = ''
      expect(contact).to be_invalid
      expect(contact.errors[:email]).to include("を入力してください")
    end
    it "phone_numberが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      contact.phone_number = ''
      expect(contact).to be_invalid
      expect(contact.errors[:phone_number]).to include("を入力してください")
    end
    it "subjectが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      contact.subject = ''
      expect(contact).to be_invalid
      expect(contact.errors[:subject]).to include("を入力してください")
    end
    it "massageが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      contact.message = ''
      expect(contact).to be_invalid
      expect(contact.errors[:message]).to include("を入力してください")
    end
  end
end