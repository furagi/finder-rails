class Girl < ActiveRecord::Base
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories #, :reject_if => :all_blank
  has_many :photos, dependent: :destroy
  validates :name, presence: true, length: { in: 2..100 }
  validates :description, presence: true, length: { maximum: 1000 }

  def main_photo
    if self.main_photo_id.nil?
      false
    else
      Photo.find(self.main_photo_id)
    end
  end

  def main_photo_should_belongs_to_self
    if self.main_photo_id.nil?
      return
    end
    if self.photos.nil? or self.photos.empty? or !self.photos.find(self.main_photo_id)
      record.errors[:photo] << "Main photo should belongs to self"
    end
  end

  def as_json(options = nil)
    girl = super({ only: [:id, :name, :description, :rating, :main_photo_id] }.merge(options || {}))
    girl[:category_ids] = categories.map{ |category| category.id }
    girl[:photos] = self.photos
    girl
  end

end
