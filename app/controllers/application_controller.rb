class ApplicationController < ActionController::Base
  before_action :set_query
  include Pundit::Authorization

  def set_query
    @query = Group.ransack(params[:q])
  end
end
