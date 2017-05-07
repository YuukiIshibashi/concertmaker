class TopController < ApplicationController
  def show
    @user = current_user
    @performer = current_performer
  end
end
