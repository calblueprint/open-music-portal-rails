class ConfirmationsController < ApplicationController
  def new
    current_user.send_confirmation if current_user and !current_user.confirmed
  end
end
