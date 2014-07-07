module AccountCategoriesHelper
  def nested_account_categories(categories,template_name)
    return "" unless categories
    categories.map do |category, sub_categories|
      render(partial: template_name, locals: {account_category: category}) + content_tag(:div, nested_account_categories(sub_categories, template_name), :class => "nested_categories")
    end.join.html_safe
  end
end