class Post < ApplicationRecord
  belongs_to :user

  has_many :post_selects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :tag_lists, dependent: :destroy
  has_many :tags, through: :tag_lists

  attachment :post_image

  # save_tagインスタンスメソッドの中身
  def save_tag(sent_tags)
    current_tags = tags.pluck(:tag_name) unless tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
      old_tags.each do |old|
        post_tags.delete PostTag.find_by(tag_name: old)
      end

      new_tags.each do |new|
        new_post_tag = Tag.find_or_create_by(tag_name: new)
        tags << new_post_tag
      end
  end

  # validates :post_body, presence: true, length: { maximum: 120 }
  # validates :select_a, presence: true, length: { maximum: 50 }
  # validates :select_b, presence: true, length: { maximum: 50 }

  # ！！！！！！！本番時にコメントアウトする！！！！！！！！！！
end
