class Category < ActiveRecord::Base
  has_ancestry orphan_strategy: :adopt
  validates :name, presence: true, length: {maximum:32}
  validates :user_id, presence: true
  validates :description, length: {maximum:255}
  validates :default_account_type, inclusion: { in: Account::TYPES + [nil]}
  belongs_to :user
  has_many :accounts, foreign_key: "category_id"

  after_create :setup_earning_expense_accounts
  #TODO should limit the parent row to be the same user
  #TODO should validate the parent is not himself


  private

  # create one account for every category whose default account type is earning & expense account
  def setup_earning_expense_accounts
    return unless %w(EarningAccount ExpenseAccount).include?  self.default_account_type
    self.accounts.create!(name: self.name, description: self.description, type: self.default_account_type, user_id: self.user_id)
  end


end
