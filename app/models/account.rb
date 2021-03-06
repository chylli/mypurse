class Account < ActiveRecord::Base
  
  TYPES = %w(CashAccount DemandAccount LiabilityAccount CreditCardAccount EarningAccount ExpenseAccount)


  validates :name, presence: true, length: {maximum:32}
  validates :user_id, presence: true
  validates :description, length: {maximum:255}
  validates :balance, presence: true
  validates :currency_id, presence: true
  belongs_to :user
  belongs_to :category, class_name: "Category"
  belongs_to :currency
  has_many :debit_transactions, foreign_key: "debit_id", class_name: "Transaction"
  has_many :credit_transactions, foreign_key: "credit_id", class_name: "Transaction"

  def exchanged_balance
    balance * currency.exchange_rate
  end

  for t in TYPES
    lambda { |t2|
      scope t2.underscore.pluralize.to_sym, -> {where(type: t2)}
    }.call(t)
  end

  def self.types_select_option
    types = TYPES
    # dont create accounts of these two types.
    # only create automatically when the categories created.
    %w(EarningAccount ExpenseAccount).each {|t| types.delete(t)}
    types.map {|option| [option,option]}
  end

  before_save :recalculate_balance

  #TODO validate default value


  def recalculate_balance!
    #it will call recalculate_balance before save
    save!
  end

  private

  def recalculate_balance
    self.balance = self.init_balance + self.credit_transactions.sum('credit_amount') - self.debit_transactions.sum('debit_amount')
  end

  
end
