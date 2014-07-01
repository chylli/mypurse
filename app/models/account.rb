class Account < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {maximum:32}
  validates :user_id, presence: true
  validates :description, length: {maximum:255}
  validates :balance, presence: true
  belongs_to :user
  belongs_to :category, class_name: "AccountCategory"
  belongs_to :currency
  has_many :debit_transactions, foreign_key: "debit_id", class_name: "Transaction"
  has_many :credit_transactions, foreign_key: "credit_id", class_name: "Transaction"

  for t in Mypurse::Application.config.available_account_types
    lambda { |t2|
      scope t2.underscore.pluralize.to_sym, -> {where(type: t2)}
    }.call(t)
  end

  #TODO validate default value

end
