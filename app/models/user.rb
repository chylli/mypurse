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
    self.system_accounts.create(name: "income", description: "total income", balance: "0.00")
    self.system_accounts.create(name: "outcome", description: "total outcome", balance: "0.00")
    root_category = self.account_categories.create(name: "Accounts", description: "All Accounts")
    property_center = self.account_categories.create(name: "Property Center", description: "Property Center", default_account_type: "DemandAccount", parent_id: root_category.id)
    self.account_categories.create(name: "Cash", description: "Cash", default_account_type: "CashAccount", parent_id: property_center.id)
    bank_center = self.account_categories.create(name: "Bank Center", description: "Bank Center", default_account_type: "DemandAccount", parent_id: property_center.id)
    self.account_categories.create(name: "Demand Deposit", description: "Demand Deposit", default_account_type: "DemandAccount", parent_id: bank_center.id)
    liability_center = self.account_categories.create(name: "Liability Center", description: "Liability Center", default_account_type: "CreditCardAccount", parent_id: root_category.id)
    self.account_categories.create(name: "Credit Card", description: "Credit Card", default_account_type: "CreditCardAccount", parent_id: liability_center.id)
  end

end
