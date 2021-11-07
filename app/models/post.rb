class Post < ApplicationRecord

  belongs_to :user


  has_many :post_selects, dependent: :destroy

  attachment :post_image
  attachment :user_photo
end
