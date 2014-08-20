class Transaction < ActiveRecord::Base
  validates :debit_id, presence: true  
  validates :credit_id, presence: true  
  validates :credit_amount, presence: true  
  validates :debit_amount, presence: true  
  validates :user_id, presence: true
  validates :time, presence: true
  belongs_to :user
  belongs_to :debit, class_name: "Account"
  belongs_to :credit, class_name: "Account"
  #TODO validate debit credit have real object and belongs to the user
  #TODO set default time

  after_create :recalculate_accounts
  after_update :recalculate_accounts
  after_destroy :recalculate_accounts

  private

  def recalculate_accounts
    self.debit.recalculate_balance!
    self.credit.recalculate_balance!
  end


end
