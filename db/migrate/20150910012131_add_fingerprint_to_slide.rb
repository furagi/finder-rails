class AddFingerprintToSlide < ActiveRecord::Migration
  def up
    add_column :slides, :image_fingerprint, :string, null: false
    add_index :slides, :image_fingerprint, unique: true
  end

  def down
    remove_column :slides, :image_fingerprint
  end
end
