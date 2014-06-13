json.array!(@config_sets) do |config_set|
  json.extract! config_set, :id, :name, :config_type, :deleted_at, :expired_at
  json.url config_set_url(config_set, format: :json)
end
