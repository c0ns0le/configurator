class RenameOrganizationColumn < ActiveRecord::Migration
  def change
    rename_column :organizations, :organization_id, :parent_id
  end
end
