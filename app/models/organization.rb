class Organization < ActiveRecord::Base
  belongs_to :organization
  # gets the config for a service
  def config_for(service)
    current_org = self
    org_list = [ current_org ]
    while current_org.organization != nil 
      org_list << current_org.organization
      current_org = current_org.organization
    end
    settings = {}
    ServiceDefaultValue.where( service:service, status:'enabled').each do |x|
      settings[x.key] = x.value
    end
    org_list.reverse.each do |x| 
      ModifiedValue.where(organization:x, service:service).each do |y|      
        logger.debug "#{y.key} :: #{y.value}"
        settings[y.key] = y.value
      end
    end
    settings
  end
end
