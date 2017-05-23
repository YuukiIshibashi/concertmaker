class PastEvent < ActiveRecord::Base
  mount_uploader :movie, MovieUploader
  mount_uploader :image, ImageUploader
  belongs_to :performer
  belongs_to :prefecture

end
