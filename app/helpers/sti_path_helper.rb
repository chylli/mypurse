module StiPathHelper
  # helpers/accounts_helper.rb
  # Returns a dynamic path based on the provided parameters
  def sti_category_path(type = "Category", account = nil, action = nil)
    sti_path(type, account, action)
  end

  def sti_account_path(type = "Account", account = nil, action = nil)
    sti_path(type, account, action)
  end

  def sti_path( type, account, action)
    send "#{format_sti(action, type, account)}_path", account
  end

  def format_sti(action, type, account)
    action || account ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
