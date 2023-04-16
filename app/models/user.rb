class User < ApplicationRecord
  validates :username, presence: true, length:{minimun:3, maximum:25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness:true, length:{maximum:105},format: {with: VALID_EMAIL_REGEX}
  has_many :articles

end
