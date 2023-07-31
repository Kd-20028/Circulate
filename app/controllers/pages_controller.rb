class PagesController < ApplicationController
  def home
    @posts = current_user.groups.map(&:posts).flatten

  end
end
