class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, length: {within: 6..20, message: "should be 6 to 20 characters", on: :create}
  has_secure_password
end
