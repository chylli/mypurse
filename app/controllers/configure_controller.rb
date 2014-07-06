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
    # TODO fix this account to @user.accountcategories
    @account_categories = AccountCategory.all
  end

  def accounts
  end

end
