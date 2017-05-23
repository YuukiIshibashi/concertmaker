class Event < ActiveRecord::Base
  belongs_to :prefecture
  has_many   :candidacies,      dependent: :destroy
  has_many   :performers,       through: :candidecies
  mount_uploader :image, ImageUploader

  scope :date_field, -> {
    where(status: 0)
    .where(end: Date.today..Date.today.advance(years: 1))
  }


end
