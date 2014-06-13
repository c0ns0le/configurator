class CreateConfigSets < ActiveRecord::Migration
  def change
    create_table :config_sets do |t|
      t.string :name
      t.string :config_type
      t.timestamp :deleted_at
      t.timestamp :expired_at

      t.timestamps
    end
  end
end
