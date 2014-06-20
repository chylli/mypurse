json.array!(@accounts) do |account|
  json.extract! account, :id, :user_id, :name, :description, :category_id, :type_id, :balance
  json.url account_url(account, format: :json)
end
