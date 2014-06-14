class ConfigSet < ActiveRecord::Base
  STATUS_ENABLED='enabled'
  def default_values
    return_hash= {}
    ConfigSetValue.where(organization_id:nil, config_set_id:self.id, status:STATUS_ENABLED).each do |x| 
      case(x.config_set.config_type) 
      when 'list' then
        return_hash[x.key] ||= []
        return_hash[x.key] << x.value              
      else
            return_hash[x.key]=x.value
      end
    end
    return_hash
  end
end
