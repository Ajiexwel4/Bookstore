json.extract! order, :id, :number, :complated_at, :status, :total, :created_at, :updated_at
json.url order_url(order, format: :json)