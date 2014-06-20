class AccountCategory < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {maximum:32}
  validates :user_id, presence: true
  validates :description, length: {maximum:255}
  belongs_to :user
  belongs_to :parent, class_name: "AccountCategory"
  has_many :children, class_name: "AccountCategory", foreign_key: "parent_id", dependent: :destroy
  has_many :accounts, foreign_key: "category_id"
  #TODO should limit the parent row to be the same user
  #TODO should validate the parent is not himself
end
