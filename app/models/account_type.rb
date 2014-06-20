class AccountType < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {maximum:32}
  validates :user_id, presence: true
  validates :description, length: {maximum:255}
  belongs_to :user
  has_many :accounts, foreign_key: "type_id"
end
