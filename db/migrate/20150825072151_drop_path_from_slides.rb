class DropPathFromSlides < ActiveRecord::Migration
  def change
    remove_column :slides, :path
  end
end
