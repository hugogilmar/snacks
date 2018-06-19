class User < ApplicationRecord
  # behaviours
  authenticates_with_sorcery!
  include Unique
  include Token

  # attributes
  enum role: [ :admin, :customer ], _prefix: true
end
