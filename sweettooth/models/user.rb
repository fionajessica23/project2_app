class User < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  has_secure_password
end
