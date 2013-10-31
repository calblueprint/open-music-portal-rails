class StaticPagesController < ApplicationController

  def home
    @announcements = Announcement.all
  end

  def profile
  end

  def registration
  end

end
