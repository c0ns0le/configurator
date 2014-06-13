class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :office_type
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
