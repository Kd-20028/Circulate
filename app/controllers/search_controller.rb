class SearchController < ApplicationController
  def index
    @query = Group.ransack(params[:q])
    @groups = @query.result(distinct: true)
  end
end
