class CreateServiceDefaultValues < ActiveRecord::Migration
  def change
    create_table :service_default_values do |t|
      t.string :key
      t.string :value
      t.string :status
      t.string :data_type
      t.string :deleted_at
      t.string :expired_at
      t.references :service, index: true

      t.timestamps
    end
  end
end
