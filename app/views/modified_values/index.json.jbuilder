json.array!(@modified_values) do |modified_value|
  json.extract! modified_value, :id, :key, :value, :status, :organization_id, :service_id
  json.url modified_value_url(modified_value, format: :json)
end
