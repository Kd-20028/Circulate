class Event < ApplicationRecord
  enum status: { pending: 'pending', approved: 'approved', rejected: 'rejected' }
  after_update :check_and_delete_rejected_event

  belongs_to :group
  belongs_to :user

  def pending?
    status == 'pending'
  end

  private

  def check_and_delete_rejected_event
    if saved_change_to_status? && status_was == "pending" && status == "rejected"
      # Delete the event
      self.destroy
    end
  end
end
