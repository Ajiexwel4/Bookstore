class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum status: [:unprocessed, :approved, :rejected]

end
