class User < ApplicationRecord
  # behaviours
  authenticates_with_sorcery!
  include Unique
  include Token

  # associations
  has_many :orders

  # attributes
  enum role: [ :admin, :customer ], _prefix: true

  # validations
  validates :email, :name, presence: true
  validates :email, uniqueness: true, if: :email_changed?
  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
