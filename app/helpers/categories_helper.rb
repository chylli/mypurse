module CategoriesHelper
  def nested_categories(categories,template_name)
    return "" unless categories
    categories.map do |category, sub_categories|
      render(partial: template_name, locals: {category: category}) + content_tag(:div, nested_categories(sub_categories, template_name), :class => "nested_categories")
    end.join.html_safe
  end

end
