class AddFingerprintToPhoto < ActiveRecord::Migration
  def up
    add_column :photos, :image_fingerprint, :string, null: false
    add_index :photos, :image_fingerprint, unique: true
  end

  def down
    remove_column :photos, :image_fingerprint
  end
end
