class User < ActiveRecord::Base
  has_many :recipes
  has_many :bookmarks
  has_secure_password
  validates :email, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, :email, presence: true
  validates :name, :email, length: { maximum: 200 }
end
