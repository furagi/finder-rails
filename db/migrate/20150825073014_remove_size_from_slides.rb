class RemoveSizeFromSlides < ActiveRecord::Migration
  def change
    remove_column :slides, :size
  end
end
