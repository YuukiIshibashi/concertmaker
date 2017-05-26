class Performer < ActiveRecord::Base
  validates :message, length: { maximum: 10 }
  validates :name, presence: true
  validates :email, presence: true
  validates :movie, presence: true
  validates :prefecture, presence: true
  #attr_accessor :current_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :prefecture
  belongs_to :jenre
  has_many   :candidacies,      dependent: :destroy
  has_many   :events,       through: :candidecies
  has_many :requests
  has_many :replies
  has_many :supports
  has_many :past_events

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   mount_uploader :avatar, AvatarUploader
   mount_uploader :movie, MovieUploader

   def candidate?(event)
     Candidacy.find_by(event_id: event, performer_id: self.id)
   end

end
