class Contact < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :contact_email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :contact_name, presence: true, length: { maximum: 50 }
  validates :contact_subject, presence: true, length: { maximum: 100 }
  validates :contact_message, presence: true, length: { maximum: 500 }
end
