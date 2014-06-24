class Transaction < ActiveRecord::Base
  validates :category_id, presence: true
  validates :debit_id, presence: true  
  validates :credit_id, presence: true  
  validates :amount, presence: true  
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :category, class_name: "TransactionCategory"
  belongs_to :debit, class_name: "Account"
  belongs_to :credit, class_name: "Account"
  #TODO validate category debit credit have real object
end
