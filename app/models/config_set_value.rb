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
