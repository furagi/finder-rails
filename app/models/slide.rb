class Slide < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment :image, presence: true,
    content_type: { content_type: "image/jpeg" },
    size: { in: 50..5120.kilobytes }
  validates :image_fingerprint, :uniqueness => { :message => "Image has already been uploaded." }

  def as_json(options = nil)
    slide = super({ only: [:id, :image_content_type, :image_file_name, :image_file_size] }.merge(options || {}))
    slide[:url] = self.image.url
    slide
  end
end
