class FixPhotos < ActiveRecord::Migration
  def change
    change_column :photos, :girl_id, :integer, null: false
    change_column :photos, :image_file_name, :string, limit: 255, null: false
    change_column :photos, :image_content_type, :string, limit: 255, null: false
    change_column :photos, :image_file_size, :integer, null: false
    change_column :photos, :image_updated_at, :datetime, null: true
    change_column :photos, :main, :boolean, null: false, default: false
  end
end
