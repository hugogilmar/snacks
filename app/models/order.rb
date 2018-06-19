class Order < ApplicationRecord
  # behaviours
  include Unique

  # associations
  belongs_to :user
  belongs_to :product

  # attributes
  attr_accessor :product_uuid

  # validations
  validates :product_uuid, presence: true, length: { is: 36 }
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than: 0, only_integer: true }
  validate :stock_availability

  # callbacks
  before_validation :set_product
  before_create :set_total
  after_create :decrease_stock!

  # methods
  def decrease_stock!
    self.product.decrease_stock!(self.quantity)
  end

  def set_product
    self.product = Product.find_by(uuid: self.product_uuid)

    unless self.product.nil?
      self.price = self.product.price
    end
  end

  def set_total
    self.total = self.price * self.quantity
  end

  def stock_availability
    unless self.product.nil?
      if self.product.stock < self.quantity
        errors.add(:quantity, "no stock available")
      end
    end
  end
end
