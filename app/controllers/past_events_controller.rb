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

  def edit
    @past_event = PastEvent.find(params[:id])
  end

  def update
    @past_event = PastEvent.find(params[:id])
    @past_event.update(past_event_params)
    redirect_to past_event_path(@past_event.id)

  end

  def destroy
    @past_event = PastEvent.find(params[:id])
    @past_event.destroy
    redirect_to performer_mypage_path(current_performer.id)

  end


  private
		def past_event_params
			params.require(:past_event).permit(:title,  :date, :prefecture_id, :prace, :content, :performer_id, :image, :image_cache, :movie)
		end
end
