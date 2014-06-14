class ConfigSet < ActiveRecord::Base
  STATUS_ENABLED='enabled'
  def default_values
    return_hash= {}
    ConfigSetValue.where(organization_id:nil, config_set_id:self.id, status:STATUS_ENABLED).each do |x| 
      return_hash[x.key]=x.value
    end
    return_hash
  end
end
