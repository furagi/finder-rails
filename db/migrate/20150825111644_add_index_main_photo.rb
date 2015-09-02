class AddIndexMainPhoto < ActiveRecord::Migration
  def change
    add_index :photos, [:girl_id, :main], :unique => true
  end
end
