module AccountCategoriesHelper
  def nested_account_categories(categories)
    categories.map do |category, sub_categories|
      render(category) + content_tag(:div, nested_account_categories(sub_categories), :class => "nested_categories")
    end.join.html_safe
  end
end