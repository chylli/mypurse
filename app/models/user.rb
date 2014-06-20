class User < ActiveRecord::Base
  # used to authenticate the current user when update the user, to add errors into the user.errors
  attr_reader :current_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, length: {within: 6..20, message: "should be 6 to 20 characters", on: :create}
  has_secure_password
  has_many :types, class_name: "AccountType",  dependent: :destroy
  has_many :categories, class_name: "AccountCategory",  dependent: :destroy
  has_many :accounts, dependent: :destroy
end
