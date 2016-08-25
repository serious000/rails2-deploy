class User < ActiveRecord::Base
  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 2, maximum: 25}
  validates :email, presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 2, maximum: 150},
              format: { with: EMAIL_REGEX }
  has_secure_password
end
