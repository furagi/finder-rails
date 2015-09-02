class Category < ActiveRecord::Base
  has_and_belongs_to_many :girls
  validates :name, presence: true, length: { in: 2..100 }
  validates :name, uniqueness: true
end
