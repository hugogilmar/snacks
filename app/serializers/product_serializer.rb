class ProductSerializer < ActiveModel::Serializer
  attributes :uuid, :sku, :name, :price, :likes
  attribute :likes_count, key: :likes
end
