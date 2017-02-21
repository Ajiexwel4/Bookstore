class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories

  mount_uploader :cover, CoverUploader

  validates_processing_of :cover
  validate :cover_size_validation

  default_scope { limit(12) }
  scope :newest, ->{ order(:created_at) }
  # scope :popular, ->{} # need to implement
  scope :cheaper, ->{ order(:price) }
  scope :expensive, ->{ order(price: :desc) }


  private
  def cover_size_validation
    errors[:cover] << "should be less than 500KB" if cover.size > 0.5.megabytes
  end
end
