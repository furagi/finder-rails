class AddForeignKeyToMain < ActiveRecord::Migration
  def change
    add_foreign_key :girls, :photos, column: :main_photo
  end
end
