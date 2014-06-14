configs = {}
ConfigSet.all.each do |config_set|
  configs[config_set.name] = @organization.values_for(config_set)
end
 json.extract! @organization, :id, :name, :office_type, :city, :state, :parent_id
json.configs = configs