class MusiciansController < ApplicationController
  def index
    @performers = Performer.all
  end

  def show
    @request = Request.new
    @performer = Performer.find(params[:id])

  end

  def event
    @performer = Performer.find(params[:format])
    @past_events = PastEvent.where(performer_id: @performer.id)
  end

  def search
      @performers = Performer.all
      @performers = @performers.where(prefecture_id: params[:prefecture_id]) if params[:prefecture_id].present?
      @performers = @performers.where(jenre_id: params[:jenre_id]) if params[:jenre_id].present?
  end
end
