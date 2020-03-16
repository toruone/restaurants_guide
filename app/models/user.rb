class User < ApplicationRecord
  validates :email, presence: true
  scope :by_new, ->{ order(updated_at: :desc) }
end
