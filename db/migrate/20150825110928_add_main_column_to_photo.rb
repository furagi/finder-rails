class AddMainColumnToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :main, :boolean
  end
end
