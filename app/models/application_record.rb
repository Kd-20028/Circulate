class ApplicationRecord < ActiveRecord::Base

  primary_abstract_class
  include Pundit::Authorization
  private

  def pundit_user
    current_user
  end
end
