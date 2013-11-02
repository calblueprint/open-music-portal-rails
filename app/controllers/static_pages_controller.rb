class StaticPagesController < ApplicationController

  def home
    @announcements = Announcement.all
  end

end
