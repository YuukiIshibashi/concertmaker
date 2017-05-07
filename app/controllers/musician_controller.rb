class MusicianController < ApplicationController
  def index
    @performers = Performer.all
  end

  def show
    @request = Request.new
    @performer = Performer.find(params[:id])
  end
end
