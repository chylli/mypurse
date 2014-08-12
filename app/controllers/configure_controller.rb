class ConfigureController < ApplicationController
  def language
  end
  
  def update_language
    @user.language = params[:user][:language]
    respond_to do |format|
      if @user.save
        format.js
      end
    end
  end

  #TODO test active class in haml
  def categories
    @category = @user.account_categories.new
    @categories = Category.arrange_as_array({:order => 'name'}, @user.categories.arrange(:order => 'name'))
  end

  def accounts
    @accounts = []
    @account = Account.new(user_id: @user.id, currency_id: @user.currency_id)
    if params[:category_id]
      category_id = params[:category_id].to_i
      root_category = Category.find(category_id)
      @accounts = build_accounts_by_tree(root_category)
      @account.category_id = category_id
    else
      @accounts = @user.accounts
    end

    @categories = Category.arrange_as_array({:order => 'name'}, @user.account_categories.arrange(:order => 'name'))



  end

  private

  # build accounts from category tree
  def build_accounts_by_tree(root_category)
    accounts = root_category.accounts.to_a
    if root_category.has_children?
      root_category.children.each {|category|
        accounts.concat(build_accounts_by_tree(category))
      }
    end
    accounts
  end

end

