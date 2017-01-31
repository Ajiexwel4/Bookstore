class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories

  mount_uploader :cover, CoverUploader

  validates_processing_of :cover
  validate :cover_size_validation

  private
  def cover_size_validation
    errors[:cover] << "should be less than 500KB" if cover.size > 0.5.megabytes
  end
end
