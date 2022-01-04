equire 'rails_helper'

describe 'Blogモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { blog.valid? }

    let(:blog) { build(:blog) }

    context 'titleカラム' do
      it '空欄でないこと' do
        blog.title = ''
        blog.valid?
      end
      it '1文字以上であること:1は○' do
        blog.title = Faker::Lorem.characters(number: 1)
        blog.valid?
      end
      it '15文字以下であること:15は○' do
        blog.title = Faker::Lorem.characters(number: 15)
        blog.valid?
      end
      it '15文字以下であること:16は×' do
        blog.title = Faker::Lorem.characters(number: 16)
        blog.valid?
      end
    end

    context 'contentカラム' do
      it '空欄でないこと' do
        blog.content = ''
        blog.valid?
      end
      it '1文字以上であること:1は○' do
        blog.content = Faker::Lorem.characters(number: 1)
        blog.valid?
      end
      it '200文字以下であること:200は○' do
        blog.content = Faker::Lorem.characters(number: 200)
        blog.valid?
      end
      it '200文字以下であること:201は×' do
        blog.content = Faker::Lorem.characters(number: 201)
        blog.valid?
      end
    end
  end
end