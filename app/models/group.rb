class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :group_ownerships
  has_many :owners, through: :group_ownerships, source: :user
  has_many :posts
  has_many :events

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
