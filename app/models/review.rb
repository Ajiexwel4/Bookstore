class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :title, :comment, :grade, presence: true
  validates :title, length: { maximum: 80 }
  validates :comment, length: { maximum: 500 }
  validates :grade, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  enum status: [:unprocessed, :approved, :rejected]
end
