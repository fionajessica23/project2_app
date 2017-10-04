class User < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  has_secure_password
  validates :email, uniqueness: true
  validates :name, :email, presence: true
  validates :name, :email, length: { maximum: 200 }
end
