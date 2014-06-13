class AddStatusToConfigSet < ActiveRecord::Migration
  def change
    add_column :config_sets, :status, :string
  end
end
