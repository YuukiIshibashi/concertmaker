class CandidacyController < ApplicationController
  def create
    @candidacy = Candidacy.new(candidacy_params)
    @event = @candidacy.event_id
    if @candidacy.save
      redirect_to event_path(@event)
    else
      redirect_to event_index_path
    end
  end

  def destroy
    @candidated = Candidacy.find(params[:id])
    @candidated.destroy
    redirect_to event_path(@candidated.event_id)
    

  end


  private
    def candidacy_params
      params.require(:candidacy).permit(:event_id, :performer_id)
    end
end
