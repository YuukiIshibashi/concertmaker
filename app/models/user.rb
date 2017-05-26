class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  has_many :requests
  has_many :replies
  has_many :supports
  has_many :candidecies,       through: :events
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
end
