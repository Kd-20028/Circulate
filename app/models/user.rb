class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable,
         :recoverable, :validatable

  has_many :posts
  has_and_belongs_to_many :groups
  has_many :group_ownerships
  has_many :owned_groups, through: :group_owernships, source: :group
  has_one_attached :avatar


  validates :username, uniqueness: true
  validates :displayname, presence: true


end
