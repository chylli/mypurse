class Category < ActiveRecord::Base
  TYPES = %w(PropertyCategory LiabilityCategory EarningCategory ExpenseCategory)

  has_ancestry orphan_strategy: :adopt
  validates :name, presence: true, length: {maximum:32}
  validates :user_id, presence: true
  validates :description, length: {maximum:255}
  validates :default_account_type, inclusion: { in: Account::TYPES + [nil]}
  belongs_to :user
  has_many :accounts, foreign_key: "category_id"

  for t in TYPES
    lambda { |t2|
      scope t2.underscore.pluralize.to_sym, -> {where(type: t2)}
    }.call(t)
  end

  def self.types_select_option
    TYPES.map {|option| [option,option]}
  end


  after_create :setup_earning_expense_accounts
  #TODO should limit the parent row to be the same user
  #TODO should validate the parent is not himself


  def self.arrange_as_array(options={}, hash=nil)                                                                                                                                                            
    hash ||= arrange(options)
    arr = []
    hash.each do |node, children|
      arr << node
      arr += arrange_as_array(options, children) unless children.nil?
    end
    arr
  end

  def name_for_selects
    "#{'-' * depth} #{name}"
  end

  def sum_balance
    sum_result = accounts.joins('left join currencies on accounts.currency_id = currencies.id').select("sum(accounts.balance * currencies.exchange_rate)").group('category_id').take
    sum_result ? sum_result['sum'] : 0.00
  end

  #def possible_parents
  #  parents = Category.arrange_as_array(:order => 'name')
  #  return new_record? ? parents : parents - subtree
  #end

  private

  # create one account for every category whose default account type is earning & expense account
  def setup_earning_expense_accounts
    # TODO move this logic to EarningCategory and ExpenseCategory model
    return unless %w(EarningAccount ExpenseAccount).include?  self.default_account_type
    self.accounts.create!(name: self.name, description: self.description, type: self.default_account_type, user_id: self.user_id, currency_id: self.user.currency_id)
  end


end
