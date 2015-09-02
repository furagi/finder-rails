class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :path, null: false, limit: 150
      t.integer :size, limit: 8, null: false

      t.timestamps null: false
    end
  end
end
