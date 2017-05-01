class MusicianController < ApplicationController
  def index
    @performers = Performer.all
  end

  def profile
    @performer = Performer.find(params[:format])
  end
end
