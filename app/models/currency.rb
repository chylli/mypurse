class Currency < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {maximum:20}
  validates :abbr, presence: true, uniqueness: true, length: {maximum:10}
  validates :symbol, presence: true, uniqueness: true, length: {maximum:6}
  has_many :accounts
end
