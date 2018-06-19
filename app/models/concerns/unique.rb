module Unique
  extend ActiveSupport::Concern

  included do
    before_save :ensure_uuid
  end

  def ensure_uuid
    self.uuid = UUID.generate if self.uuid.blank?
  end
end
