class AccountingController < ApplicationController
  def index
  end

  def accounts
    #TODO check params category_id
    @category = Category.find(params[:category_id])
    #TODO test category is belongs to the user
    @accounts = @category.accounts
  end

  def transactions
    #TODO check params account_id
    #TODO test account is belongs to the user
    @account = Account.find(params[:account_id])
    @transactions = @account.debit_transactions.to_a + @account.credit_transactions.to_a
    @transaction = @account.debit_transactions.new(user_id: @user.id)
  end
end
