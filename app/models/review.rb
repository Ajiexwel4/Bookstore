class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  scope :approval, ->{ where(approval: true) }
end
