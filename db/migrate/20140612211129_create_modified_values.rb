class CreateModifiedValues < ActiveRecord::Migration
  def change
    create_table :modified_values do |t|
      t.string :key
      t.string :value
      t.string :status
      t.references :organization, index: true
      t.references :service, index: true

      t.timestamps
    end
  end
end
