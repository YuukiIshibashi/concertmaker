class Candidacy < ActiveRecord::Base
  belongs_to :event
  belongs_to :performer
end
