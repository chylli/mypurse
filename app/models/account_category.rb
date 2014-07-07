class AccountCategory < ActiveRecord::Base
  has_ancestry orphan_strategy: :adopt
  validates :name, presence: true, length: {maximum:32}
  validates :user_id, presence: true
  validates :description, length: {maximum:255}
  validates :default_account_type, inclusion: { in: Account::TYPES + [nil]}
  belongs_to :user
  has_many :accounts, foreign_key: "category_id"


  #TODO should limit the parent row to be the same user
  #TODO should validate the parent is not himself
end
