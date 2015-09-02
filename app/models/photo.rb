class Photo < ActiveRecord::Base
  belongs_to :girl
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment :image, presence: true,
    content_type: { content_type: "image/jpeg" },
    size: { in: 50..5120.kilobytes }

  def is_main?
    Girl.find(self.girl_id).main_photo_id == self.id
  end
end
