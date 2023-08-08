class PagesController < ApplicationController
  before_action :authenticate_user!

  def home

    @posts = current_user.groups.map(&:posts).flatten

  end
end
