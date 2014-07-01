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
    scope t.underscore.pluralize.to_sym, -> {where(type: t)}
  end

  #scope :system_accounts, -> { where(type: 'SystemAccount')}
  #scope :cash_accounts, -> { where(type: 'CashAccount')}
  #scope :

  #TODO validate default value

  #def self.types
  #  %w(SystemAccount CashAccount DemandAccount LiabilityAccount CreditCardAccount)
  #end
end
