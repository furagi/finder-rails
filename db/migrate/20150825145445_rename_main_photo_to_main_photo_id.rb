class RenameMainPhotoToMainPhotoId < ActiveRecord::Migration
  def change
    rename_column :girls, :main_photo, :main_photo_id
  end
end
