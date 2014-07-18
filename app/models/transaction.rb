class Transaction < ActiveRecord::Base
  validates :debit_id, presence: true  
  validates :credit_id, presence: true  
  validates :amount, presence: true  
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :debit, class_name: "Account"
  belongs_to :credit, class_name: "Account"
  #TODO validate debit credit have real object
end
