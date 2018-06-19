class Like < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :product, counter_cache: true

  # validations
  validate :user_has_likes

  # methods
  def user_has_likes
    if self.product.likes.exists?(user_id: self.user.id)
      errors.add(:user, "has already like this product")
    end
  end
end
