class ReportsController < ApplicationController
  def property
    @property_center = PropertyCategory.find_by! name: I18n.t('Property Center')
    @accounts = get_accounts_of_categories(@property_center).sort {|a,b| a.name <=> b.name}
  end

  def earning
  end

  def expense
  end

  private

  def get_accounts_of_categories(category)
    accounts = category.accounts.to_a.select {|a| a.balance > 0}
    if category.has_children?
      category.children.each {|sub_category| 
        accounts += get_accounts_of_categories(sub_category)
      }
    end
    accounts
  end
end
