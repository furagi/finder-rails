class RenameMainPhotoToMainPhotoId < ActiveRecord::Migration
  def change
    remove_foreign_key :girls, column: :main_photo
    rename_column :girls, :main_photo, :main_photo_id
  end
end
