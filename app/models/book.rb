class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories
  has_many :line_items
  has_many :reviews
  has_many :pictures, as: :imageable

  validates :title, :description, :price, :publication_at, :in_stock, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :in_stock, numericality: { greater_than_or_equal_to: 0 }

  before_destroy :has_not_ref_with_line_items?

  mount_uploader :cover, ImageUploader

  validates_processing_of :cover
  validate :cover_size_validation

  scope :latest_books, ->{ last(3) }
  scope :bestsellers, ->{ first(4) }

  scope :newest, ->{ order(:created_at) }
  scope :popular, ->{ last(3) }
  scope :cheaper, ->{ order(:price) }
  scope :expensive, ->{ order(price: :desc) }

  private
    def cover_size_validation
      errors[:cover] << "should be less than 1024KB" if cover.size > 1.megabytes
    end

    def has_not_ref_with_line_items?
      line_items.empty? ? true : false
    end
end
