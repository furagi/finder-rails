class FixMain < ActiveRecord::Migration
  def change
    remove_column :photos, :main
    add_column :girls, :main_photo, :integer
  end
end
