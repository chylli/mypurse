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
  end

  def accounts
    @accounts = []
    if params[:category_id]
      root_category = Category.find(params[:category_id])
      @accounts = build_accounts_by_tree(root_category)
    else
      @accounts = @user.accounts
    end

    @categories = Category.arrange_as_array({:order => 'name'}, @user.account_categories.arrange(:order => 'name'))

    @account = Account.new(user_id: @user.id, currency_id: @user.currency_id)

    #FIXME the account form's default category is not correct
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

