class FixPhotosImageUpdatedAt < ActiveRecord::Migration
  def change
    change_column :photos, :image_updated_at, :datetime, null: true
  end
end
