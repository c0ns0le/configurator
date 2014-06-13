json.array!(@service_default_values) do |service_default_value|
  json.extract! service_default_value, :id, :key, :value, :status, :deleted_at, :expired_at, :service_id
  json.url service_default_value_url(service_default_value, format: :json)
end
