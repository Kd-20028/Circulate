class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable,
         :recoverable, :validatable

  has_many :posts
  has_and_belongs_to_many :groups

  validates :username, uniqueness: true
  validates :displayname, presence: true
end
