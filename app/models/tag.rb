class Tag < ApplicationRecord
  has_many :tag_lists, dependent: :destroy
  has_many :posts, through: :tag_lists
end
