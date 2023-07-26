class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :group_ownerships
  has_many :owners, through: :group_ownerships, source: :user
end
