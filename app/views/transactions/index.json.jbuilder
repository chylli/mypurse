json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :user_id, :category_id, :debit_id, :credit_id, :amount
  json.url transaction_url(transaction, format: :json)
end
