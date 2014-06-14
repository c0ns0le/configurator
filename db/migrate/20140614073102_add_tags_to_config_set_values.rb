class AddTagsToConfigSetValues < ActiveRecord::Migration
  def change
    add_column :config_set_values, :tag_name, :string
    add_column :config_set_values, :published_at, :datetime
  end
end
