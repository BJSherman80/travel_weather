require 'bcrypt'

class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_key
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates :password, confirmation: { case_sensitive: true }
  validates :api_key, uniqueness: true
end
