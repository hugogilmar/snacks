class User < ApplicationRecord
  # behaviours
  authenticates_with_sorcery!
  include Unique
  include Token

  # associations
  has_many :orders

  # attributes
  enum role: [ :admin, :customer ], _prefix: true
end
