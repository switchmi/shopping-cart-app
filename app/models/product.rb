class Product < ApplicationRecord
  belongs_to :category
  has_many :photos
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true
end
