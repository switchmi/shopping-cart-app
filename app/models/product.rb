class Product < ApplicationRecord
  belongs_to :category
  has_many :photos
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :stock, presence: true

  def self.search(param)
    return Product.none? if param.blank?

    param.strip!
    param.downcase!
    product_name_matches(param) #return this value if param is not blank
  end

  def self.product_name_matches(param)
    matches('name', param)
  end

  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%") #% is wildcard in sql, lower method is a postgresql to lower the field_name to lowercase
  end
end
