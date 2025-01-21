class User < ApplicationRecord
  has_secure_password
  has_many :customs

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
