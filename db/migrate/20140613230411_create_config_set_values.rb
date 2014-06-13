class CreateConfigSetValues < ActiveRecord::Migration
  def change
    create_table :config_set_values do |t|
      t.string :key
      t.string :value
      t.string :status
      t.string :data_type
      t.references :config_set, index: true
      t.references :organization, index: true
      t.timestamp :deleted_at
      t.timestamp :expired_at
      t.timestamps
    end
  end
end
