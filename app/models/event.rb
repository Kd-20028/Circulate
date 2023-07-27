class Event < ApplicationRecord
  enum status: { pending: 'pending', approved: 'approved', rejected: 'rejected' }

  belongs_to :group
  belongs_to :user

  def pending?
    status == 'pending'
  end
end
