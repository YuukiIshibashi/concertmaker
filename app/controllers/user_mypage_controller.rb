class UserMypageController < ApplicationController
  require 'rqrcode'

  def show
    
    @user = User.find(params[:id])
    @requests = Request.where(user_id: @user.id)
    @events = Event.where(user_id: @user.id)
    @events.each do |event|
      @candidacy= Candidacy.where(event_id: event.id)
    end
    @supports  = Support.where(user_id: @user.id).where(status: 0 )
    @support  = Support.find_by(id: 10 )

  end
end
