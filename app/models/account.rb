class Account < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {maximum:32}
  validates :user_id, presence: true
  validates :description, length: {maximum:255}
  belongs_to :user
  belongs_to :category, class_name: "AccountCategory"
  belongs_to :type, class_name: "AccountType"
  belongs_to :currency
  
end
