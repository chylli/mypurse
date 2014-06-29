class Currency < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {maximum:20}
  validates :abbr, presence: true, uniqueness: true, length: {maximum:10}
  validates :symbol, presence: true, uniqueness: true, length: {maximum:6}
  validates :user_id, presence: true
  has_many :accounts
  belongs_to :user
end
