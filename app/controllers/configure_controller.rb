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
  def account_categories
  end

  def accounts
    @accounts = []
    if params[:category_id]
      root_category = AccountCategory.find(params[:category_id])
      @accounts = build_accounts_by_tree(root_category)
    else
      @accounts = @user.accounts
    end

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

