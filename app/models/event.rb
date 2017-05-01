class Event < ActiveRecord::Base
  belongs_to :prefecture
  has_many   :candidacies,      dependent: :destroy
  has_many   :performers,       through: :candidecies
  mount_uploader :image, ImageUploader

  
end
