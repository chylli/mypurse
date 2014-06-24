class TransactionCategory < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {maximum:32}
  validates :user_id, presence: true
  validates :description, length: {maximum:255}
  belongs_to :user
  belongs_to :parent, class_name: "TransactionCategory"
  has_many :children, class_name: "TransactionCategory", foreign_key: "parent_id", dependent: :destroy
  #TODO add has many transaction 
  #TODO should limit the parent row to be the same user
  #TODO should validate the parent is not himself

end
