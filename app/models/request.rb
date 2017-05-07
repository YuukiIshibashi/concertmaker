class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :performer
  has_many :replies
end
