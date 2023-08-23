class User < ApplicationRecord
  has_secure_password
  has_many :articles
  validates :password, presence: true, length:{minimum: 8}
end
