class RemoveindexFromPhotosMain < ActiveRecord::Migration
  def change
    remove_index :photos, [:girl_id, :main]
  end
end
