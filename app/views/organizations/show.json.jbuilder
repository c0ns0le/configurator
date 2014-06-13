json.extract! @organization, :id, :name, :office_type, :city, :state, :organization_id, :created_at, :updated_at
configs = {}
Service.all.each do |service|
  configs[service.name] = @organization.config_for(service)
end
json.service_configs = configs