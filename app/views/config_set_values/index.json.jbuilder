json.array!(@config_set_values) do |config_set_value|
  json.extract! config_set_value, :id, :key, :value, :status, :data_type, :config_set_id, :organization_id, :deleted_at, :expired_at
  json.url config_set_value_url(config_set_value, format: :json)
end
