json.array!(@transaction_categories) do |transaction_category|
  json.extract! transaction_category, :id, :user, :name, :description, :parent_id
  json.url transaction_category_url(transaction_category, format: :json)
end
