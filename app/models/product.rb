class Product < ApplicationRecord
  # behaviours
  acts_as_paranoid
  audited only: :price
  include Unique

  # associations
  has_many :likes

  # validations
  validates :sku, :name, :price, presence: true
  validates :sku, uniqueness: true, if: :sku_changed?
  validates :sku, length: { minimum: 3, maximum: 12 }
  validates :name, length: { minimum: 3, maximum: 48 }
  validates :price, numericality: { greater_than: 0 }
  validates :stock, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  # scopes
  scope :only_available, -> { where('products.stock > 0') }

  # methods
  def decrease_stock!(quantity)
    self.stock -= quantity
    self.save
  end
end
