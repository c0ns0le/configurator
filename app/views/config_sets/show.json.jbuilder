json.extract! @config_set, :id, :name, :config_type, :deleted_at, :expired_at, :created_at, :updated_at
json.default_values @config_set.default_values