class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :name, limit: 100, null: false
      t.text :description, limit: 1000, null: false
      t.integer :rating, default: 0

      t.timestamps null: false
    end
    create_table :categories_girls, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :girl, index: true
    end
  end

end
