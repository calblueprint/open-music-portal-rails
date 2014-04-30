class StaticPagesController < ApplicationController

  def home
    @announcements = Announcement.all
  end

  def error
  end

end
