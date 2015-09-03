class Girl < ActiveRecord::Base
  has_and_belongs_to_many :categories
  has_many :photos
  validates :name, presence: true, length: { in: 2..100 }
  validates :description, presence: true, length: { maximum: 1000 }

  def main_photo
    if self.main_photo_id.nil?
      false
    else
      Photo.find(self.main_photo_id)
    end
  end
end