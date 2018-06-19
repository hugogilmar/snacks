class Product < ApplicationRecord
  # behaviours
  include Unique

  # validations
  validates :sku, :name, :price, presence: true
  validates :sku, uniqueness: true, if: :sku_changed?
  validates :sku, length: { minimum: 3, maximum: 12 }
  validates :name, length: { minimum: 3, maximum: 48 }
  validates :price, numericality: { greater_than: 0 }
end
