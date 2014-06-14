class ConfigSet < ActiveRecord::Base
  TYPE_LIST = 'list'
  STATUS_ENABLED='enabled'
  def default_values
    return_hash= {}
    ConfigSetValue.where(organization_id:nil, config_set_id:self.id, status:[ConfigSetValue::STATUS_ENABLED, ConfigSetValue::STATUS_PENDING_DELETE]).each do |x| 
      case(x.config_set.config_type) 
      when 'list' then
        return_hash[x.key] ||= []
        return_hash[x.key] << x.value              
      else
            return_hash[x.key]=x.value
      end
    end
      # find delete but not expired keys
      
      ConfigSetValue.where(organization_id:nil, config_set_id:self.id, status:[ConfigSetValue::STATUS_DELETED]).where("expired_at > ?", Time.now).each do |x| 
      case(x.config_set.config_type) 
      when 'list' then
        return_hash[x.key] ||= []
        return_hash[x.key] << x.value              
      else
            return_hash[x.key]=x.value
      end
        return_hash['warning'] ||= ""
        return_hash['warning'] << "#{x.key} is set to expire on #{x.expired_at}\n"
    end
     return_hash
  end
end
