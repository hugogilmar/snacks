class OrderSerializer < ActiveModel::Serializer
  attributes :uuid, :product_name, :quantity, :price, :total

  attribute :product_name do
    object.product.name
  end
end
