class ConfigSetValue < ActiveRecord::Base
  belongs_to :config_set  
  belongs_to :organization
end
