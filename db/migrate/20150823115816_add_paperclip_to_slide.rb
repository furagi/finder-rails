class AddPaperclipToSlide < ActiveRecord::Migration
  def change
    add_attachment :slides, :image
  end
end
