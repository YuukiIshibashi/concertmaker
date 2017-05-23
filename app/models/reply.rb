class Reply < ActiveRecord::Base
  belongs_to :request
  belongs_to :user
  belongs_to :performer
end
