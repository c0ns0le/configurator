class ModifiedValue < ActiveRecord::Base
  belongs_to :organization
  belongs_to :service
end
