class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_selects, dependent: :destroy
  has_many :comments, dependent: :destroy

  attachment :user_photo

  def self.guest
    find_or_create_by!(email: 'gest@gest.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.user_name = 'ゲスト'
    end
  end
  


  validates :user_name, length: { in: 1..10 }  

end
