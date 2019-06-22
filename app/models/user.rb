class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :comments

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },length: { maximum: 100 }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
end
