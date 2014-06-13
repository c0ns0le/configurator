json.extract! @service, :id, :name, :created_at, :updated_at
if params[:flag] == true
  json.default_values @service.service_default_values
else
  json.default_values @service.service_defaults_values(blah)
end
json.found_it if params[:flag] == "true"

