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

  end
end
