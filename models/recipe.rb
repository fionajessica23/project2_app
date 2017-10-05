class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :bookmarks
  validates :title, :content, :user_id, :category_id, presence: true
  validates :title, :difficulty, :serving, length: { maximum: 200 }
  validates :image, length: { maximum: 400 }
end
