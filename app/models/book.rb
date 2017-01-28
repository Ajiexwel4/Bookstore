class Book < ApplicationRecord
  has_many :pictures, as: :imageable
  has_many :publications
  has_many :authors, through: :publications

  belongs_to :category
  belongs_to :material
  belongs_to :dimension
end
