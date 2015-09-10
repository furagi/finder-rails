class Slide < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment :image, presence: true,
    content_type: { content_type: "image/jpeg" },
    size: { in: 50..5120.kilobytes }
  validates :image_fingerprint, :uniqueness => { :message => "Image has already been uploaded." }
end
