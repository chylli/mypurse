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
  has_many :categories, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :currencies, dependent: :destroy
  belongs_to :default_currency, class_name: 'Currency', foreign_key: 'currency_id'

  for t in Account::TYPES
    delegate t.underscore.pluralize.to_sym, to: :accounts
  end

  for t in Category::TYPES
    delegate t.underscore.pluralize.to_sym, to: :categories
  end

  after_create :setup_relative_objects


  private

  def setup_relative_objects
    rmb_currency = self.currencies.create(name: 'RMB', symbol: '￥', type: 'system')
    self.currencies.create(name: 'USD', symbol: '$', type: 'system')
    #TODO will setup default currency in the page
    self.default_currency = rmb_currency
    self.save
    #self.earning_accounts.create(name: "earning", description: "earning", balance: "0.00")
    #self.expense_accounts.create(name: "expense", description: "expense", balance: "0.00")
    root_category = self.account_categories.create!(name: I18n.t("Accounts"), description: I18n.t("All Accounts"))
    property_center = self.account_categories.create!(name: I18n.t("Property Center"), description: I18n.t("Property Center"), default_account_type: "DemandAccount", parent_id: root_category.id)
    cash_category = self.account_categories.create!(name: I18n.t("Cash"), description: I18n.t("Cash"), default_account_type: "CashAccount", parent_id: property_center.id)
    bank_center = self.account_categories.create!(name: I18n.t("Bank Center"), description: I18n.t("Bank Center"), default_account_type: "DemandAccount", parent_id: property_center.id)
    self.account_categories.create!(name: I18n.t("Demand Deposit"), description: I18n.t("Demand Deposit"), default_account_type: "DemandAccount", parent_id: bank_center.id)
    liability_center = self.account_categories.create!(name: I18n.t("Liability Center"), description: I18n.t("Liability Center"), default_account_type: "CreditCardAccount", parent_id: root_category.id)
    self.account_categories.create!(name: I18n.t("Credit Card"), description: I18n.t("Credit Card"), default_account_type: "CreditCardAccount", parent_id: liability_center.id)
    earning = self.earning_categories.create!(name: I18n.t("Earning"), description: I18n.t("Earning"),default_account_type: "EarningAccount")
    self.earning_categories.create!(name: I18n.t("Job Earning"), description: I18n.t("Job Earning"), default_account_type: "EarningAccount", parent_id: earning.id)
    expense = self.expense_categories.create!(name: I18n.t("Expense"), description: I18n.t("Expense"),default_account_type: "ExpenseAccount")
    self.expense_categories.create!(name: I18n.t("Clothes & Accessories"), description: I18n.t("Clothes & Accessories"), default_account_type: "ExpenseAccount", parent_id: expense.id)

  end

end
