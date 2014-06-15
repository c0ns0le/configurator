class ConfigSetValue < ActiveRecord::Base
  belongs_to :config_set  
  belongs_to :organization

  STATUS_ENABLED = 'enabled'
  STATUS_PENDING_ADD = 'pending_add'
  STATUS_PENDING_DELETE = 'pending_delete'
  STATUS_DELETED = 'deleted'

  def is_default?
    self.organization.nil?
  end 
  
  def self.releases
    # get all the release names
   all_tags= []
   ConfigSetValue.select(:tag_name).distinct.select(:published_at).where.not(tag_name:nil).order(published_at: :desc).each do |release|
	tag = {}
	tag['tag_name'] = release.tag_name
        # config set
	config_sets = {}
        org_sets = {}
	# there is better sql for getting this
        ConfigSetValue.where(tag_name:release.tag_name).each do |x|
		if x.is_default?
			config_sets[x.config_set.name] ||= {}
			config_sets[x.config_set.name]['name']||=x.config_set.name
			config_sets[x.config_set.name]['tag_name']||=tag['tag_name']
			config_sets[x.config_set.name]['config_sets']||= []
			config_sets[x.config_set.name]['config_sets'] << x.attributes
		else
		  	org_sets[x.organization.name] ||= x.organization.attributes
		  	org_sets[x.organization.name]['config_sets'] ||= []
		  	org_sets[x.organization.name]['config_sets'] << x.attributes
		end
        end
        tag['config_sets'] = []
        tag['orgs'] = []
	config_sets.each { |k,v| tag['config_sets'] << v }
	org_sets.each {|k,v| tag['orgs']<<v}
	tag['published_at'] = release.published_at
	all_tags << tag
   end
   all_tags
  end

  def change_value(new_value)   
    case self.status
      when STATUS_PENDING_ADD
        self.update_attributes(value:new_value)
      when STATUS_ENABLED
      ConfigSetValue.create(key:self.key, value:new_value, status:STATUS_PENDING_ADD, data_type:self.data_type, config_set_id:self.config_set)
      self.update_attributes(status:STATUS_PENDING_DELETE)
    end
  end
  
  def remove_config_set_key
    case self.status
      when STATUS_PENDING_ADD
        self.update_attributes(status:STATUS_DELETED, expired_at:Time.now, deleted_at:Time.now)
      when STATUS_ENABLED
      self.update_attributes(status:STATUS_PENDING_DELETE)
    end    
  end
  
  def publish(tag_name)
    case self.status
    when STATUS_PENDING_ADD
      self.update_attributes(status:STATUS_ENABLED, published_at:Time.now, tag_name:tag_name)
    when STATUS_PENDING_DELETE
      if self.is_default?
        exp_date = Time.now+120.days
      else
        exp_date = Time.now
      end
      self.update_attributes(status:STATUS_DELETED, deleted_at:Time.now, expired_at:exp_date)
    end
  end
  
  def rollback
    if self.config_set.config_type == 'list'
      case self.status
        when STATUS_DELETED
          self.update_attributes(status:STATUS_ENABLED, deleted_at:nil, expired_at:nil)
        when STATUS_ENABLED
        self.update_attributes(status:STATUS_DELETED, deleted_at:Time.now, expired_at:Time.now)
      end
    else
    case self.status
      when STATUS_DELETED
      self.update_attributes(status:STATUS_ENABLED, deleted_at:nil, expired_at:nil)
      when STATUS_ENABLED
      # find old deleted value
      val = ConfigSetValue.where(status:STATUS_DELETED, key:self.key).where.not(published_at:nil).order(created_at: :desc)
      unless val.empty?
        val.first.update_attributes(status:STATUS_ENABLED, deleted_at:nil, expired_at:nil)        
      end
      self.update_attributes(status:STATUS_DELETED, deleted_at:Time.now, expired_at:Time.now)  
    end
  end
  end
end
