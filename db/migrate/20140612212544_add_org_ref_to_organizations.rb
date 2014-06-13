class AddOrgRefToOrganizations < ActiveRecord::Migration
  def change
    add_reference :organizations, :organization, index: true
  end
end
