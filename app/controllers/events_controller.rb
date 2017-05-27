class EventsController < ApplicationController
  def index
    @events = Event.date_field
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @candidacy = Candidacy.new
    @candidasies = Candidacy.where(event_id: @event.id)
    if performer_signed_in?
    @candidated = Candidacy.find_by(event_id: @event.id, performer_id: current_performer.id )
    end

  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to events_path
    else
			render action: 'new'
		end
  end

  def edit
    @event = Event.find(params[:id])
  end


  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event.id)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_mypage_path(current_user.id)

  end




  private
		def event_params
			params.require(:event).permit(:title,  :start, :end, :prefecture_id, :prace, :content, :user_id, :image, :image_cache, :status)
		end


end
