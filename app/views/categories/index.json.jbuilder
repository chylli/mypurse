json.array!(@categories) do |account_category|
  json.extract! account_category, :id, :user_id, :name, :description, :parent_id
  json.url account_category_url(account_category, format: :json)
end
