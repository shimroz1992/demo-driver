json.extract! card_detail, :id, :card_no, :expiry_month, :expiry_year, :is_active, :is_default, :driver_id,
              :created_at, :updated_at
json.url card_detail_url(card_detail, format: :json)
