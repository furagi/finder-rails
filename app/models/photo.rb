class Photo < ActiveRecord::Base
  belongs_to :girl
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment :image, presence: true,
    content_type: { content_type: "image/jpeg" },
    size: { in: 50..5120.kilobytes }
  validates :image_fingerprint, :uniqueness => { :message => "Image has already been uploaded." }

  def is_main?
    Girl.find(self.girl_id).main_photo_id == self.id
  end

  def as_json(options = nil)
    photo = super({ only: [:id, :girl_id, :image_content_type, :image_file_name, :image_file_size] }.merge(options || {}))
    photo[:url] = self.image.url
    photo
  end

end
