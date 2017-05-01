class EventController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @candidacy = Candidacy.new
    @candidated = Candidacy.find_by(event_id: @event.id, performer_id: current_performer.id )
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_index_path
    else
			render action: 'new'
		end
  end




  private
		def event_params
			params.require(:event).permit(:title,  :start, :end, :prefecture_id, :prace, :content, :user_id, :image)
		end


end
