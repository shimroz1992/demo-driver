json.extract! pay_later, :id, :total_outstanding, :is_active, :driver_id, :created_at, :updated_at
json.url pay_later_url(pay_later, format: :json)
