class PerformerMypageController < ApplicationController
  def show
    @performer = current_performer
    @requests = Request.where(performer_id: @performer.id)
    @past_events = PastEvent.where(performer_id: @performer.id)
  end

  def new
  end

  def create
    performer = current_performer
    uuid = params[:uuid]
    support = Support.find_by(uuid: uuid, performer_id: current_performer.id)
    if support.present?
      if support.status == 1
        redirect_to new_performer_mypage_path, notice: "すでにポイントになっています"
      elsif support.status == 0
        n = performer.support
        n = n + 1
        performer.update(support: n )
        support.update(status: 1 )
        redirect_to performer_mypage_path(current_performer.id), notice: "応援ポイントが加算されました"
      end
    else
      redirect_to new_performer_mypage_path, notice: "認証コードがちがいます"
    end
   end
end
