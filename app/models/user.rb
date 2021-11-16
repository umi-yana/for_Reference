class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_selects, dependent: :destroy
  has_many :comments, dependent: :destroy

  attachment :user_photo

  # ーーーーーーゲストログインーーーーー
  def self.guest
    find_or_create_by!(email: 'gest@gest.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.user_name = 'ゲスト'
    end
  end

  # ーーーーーーーーーフォロー機能ーーーーーーーー  
    #フォローする側のアソシエーション
    has_many :relationships,foreign_key: :following_id
    #フォローする側がフォローしている人の情報取る
    has_many :followings, through: :relationships, source: :follower
    # フォローされる側のアソシエーション
    has_many :reverse_of_relationships,class_name: 'Relationship',foreign_key: :follower_id
  #フォローされている側がフォローしている情報を取る
    has_many :followers, through: :reverse_of_relationships, source: :following
    
    #フォローしているかを確認する
    def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
    end
  # ーーーーーーーーー（fin）フォロー機能ーーーーーーーー  


  # ---------退会機能　trueだったら、ログイン　falseだったら、ログインできない。
  def active_for_authentication?
    super && (self.is_valid == true)
  end


    # -------バリデーションーーーーーー
  validates :user_name, presence: true, length: { maximum: 11 }
  validates :user_content, length: { maximum: 120 }
end
