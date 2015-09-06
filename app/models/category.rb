class Category < ActiveRecord::Base
  has_and_belongs_to_many :girls
  accepts_nested_attributes_for :girls #
  validates :name, presence: true, length: { in: 2..100 }
  validates :name, uniqueness: true

  def as_json(options = nil)
    super({ only: [:id, :name]}.merge(options || {}))
  end
end
