class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
end
