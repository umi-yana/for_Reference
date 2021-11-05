class Post < ApplicationRecord

  belongs_to :user
  attachment :post_image
  attachment :user_photo
end
