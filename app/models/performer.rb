class Performer < ActiveRecord::Base
  attr_accessor :current_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :prefecture
  belongs_to :jenre
  has_many   :candidacies,      dependent: :destroy
  has_many   :events,       through: :candidecies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   mount_uploader :avatar, AvatarUploader
   mount_uploader :movie, MovieUploader

   def candidate?(event)
     Candidacy.find_by(event_id: event)
   end

end
