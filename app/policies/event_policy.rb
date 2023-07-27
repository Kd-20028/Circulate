class EventPolicy < ApplicationPolicy
  class Scope < Scope

  def resolve
    if user && user != group.owner
      scope.where(status: 'approved')
    else
      scope.all
    end
  end


  attr_reader :user, :group, :owners

  def new?
    create?
  end

  def create?
    puts "create? method called" # Add this debug statement
    puts "User: #{user.inspect}" # Output user value to console
    user && user.groups.include?(group)
  end

  def approve?
    # Only the group owner can approve events
    user && user == record.group.owner
  end

  def reject?
    # Only the group owner can reject events
    user && user == record.group.owner
  end

end
end
