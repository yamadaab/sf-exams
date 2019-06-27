class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories
  validates :post, uniqueness: { scope: :category_id }

  validates :content, presence: true

end
