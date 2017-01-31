class Book < ApplicationRecord
  has_many :pictures, as: :imageable
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories
end
