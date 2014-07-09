# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  def self.available_languages
    I18n.available_locales.map(&:to_s)
  end
  # used to authenticate the current user when update the user, to add errors into the user.errors
  attr_reader :current_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, length: {within: 6..20, message: "should be 6 to 20 characters", on: :create}
  validates :language, inclusion: {within: available_languages, allow_blank: true, allow_nil: true}
  has_secure_password
  has_many :account_categories, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :currencies, dependent: :destroy

  for t in Account::TYPES
    delegate t.underscore.pluralize.to_sym, to: :accounts
  end

  after_create :setup_relative_objects


  private

  def setup_relative_objects
    self.currencies.create(name: 'RMB', symbol: '￥', type: 'system')
    self.currencies.create(name: 'USD', symbol: '$', type: 'system')
    #self.earning_accounts.create(name: "earning", description: "earning", balance: "0.00")
    #self.expense_accounts.create(name: "expense", description: "expense", balance: "0.00")
    root_category = self.account_categories.create!(name: I18n.t("Accounts"), description: I18n.t("All Accounts"))
    property_center = self.account_categories.create!(name: I18n.t("Property Center"), description: I18n.t("Property Center"), default_account_type: "DemandAccount", parent_id: root_category.id)
    self.account_categories.create!(name: I18n.t("Cash"), description: I18n.t("Cash"), default_account_type: "CashAccount", parent_id: property_center.id)
    bank_center = self.account_categories.create!(name: I18n.t("Bank Center"), description: I18n.t("Bank Center"), default_account_type: "DemandAccount", parent_id: property_center.id)
    self.account_categories.create!(name: I18n.t("Demand Deposit"), description: I18n.t("Demand Deposit"), default_account_type: "DemandAccount", parent_id: bank_center.id)
    liability_center = self.account_categories.create!(name: I18n.t("Liability Center"), description: I18n.t("Liability Center"), default_account_type: "CreditCardAccount", parent_id: root_category.id)
    self.account_categories.create!(name: I18n.t("Credit Card"), description: I18n.t("Credit Card"), default_account_type: "CreditCardAccount", parent_id: liability_center.id)
    earning = self.account_categories.create!(name: "Earning", description: "Earning",default_account_type: "EarningAccount")
    self.account_categories.create!(name: "Job Earning", description: "Job Earning", default_account_type: "EarningAccount", parent_id: earning.id)
    expense = self.account_categories.create!(name: "Expense", description: "Expense",default_account_type: "ExpenseAccount")
    self.account_categories.create!(name: "Clothes & Accessories", description: "Clothes & Accessories", default_account_type: "ExpenseAccount", parent_id: expense.id)


  end

end
