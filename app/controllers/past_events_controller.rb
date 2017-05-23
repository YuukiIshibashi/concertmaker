class PastEventsController < ApplicationController

  def index
    @past_events = PastEvent.all
  end


  def new
    @past_event = PastEvent.new
  end

  def show
    @past_event = PastEvent.find(params[:id])
  end

  def create
    @past_event = PastEvent.new(past_event_params)
    @past_event.performer_id = current_performer.id
    if @past_event.save
      redirect_to past_events_path
    else
			render action: 'new'
		end
  end


  private
		def past_event_params
			params.require(:past_event).permit(:title,  :date, :prefecture_id, :prace, :content, :performer_id, :image, :image_cache, :movie)
		end
end
