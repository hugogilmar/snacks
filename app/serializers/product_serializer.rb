class ProductSerializer < ActiveModel::Serializer
  attributes :uuid, :sku, :name, :price
end
