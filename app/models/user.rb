class User < ApplicationRecord
  has_many :favorites
  has_many :movies, through: :favorites

  validates :username, presence: true, uniqueness: true
  has_secure_password
end
