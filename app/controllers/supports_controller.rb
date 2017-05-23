class SupportsController < ApplicationController

  def new
    @support = Support.new
  end

  def create
    @support = Support.new(support_params)
    @token = SecureRandom.uuid
    performer = Performer.find_by_email(support_params[:email])
    exisiting_support = Support.where(performer_id: performer.id).where(user_id: current_user.id).where(status: 0 )


    if exisiting_support.present?
      redirect_to new_support_path, notice: "以前発行したコードがまだポイントになっていません"
    else
    @support.performer_id = performer.id
    @support.uuid = @token
    #@qr = "http://localhost:3000/supports?uuid=#{@token} "


      if @support.save
        redirect_to support_path(@support)
      else
			  redirect_to new_support_path, notice: "失敗しました"
		  end
    end
  end

  def show
    @support = Support.find(params[:id])
  end

  def update
    if performer_signed_in?
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
    else
      redirect_to root_path, notice: "パフォーマーとしてログインしてください"
    end
   end

  def destroy
    @support = Support.find(params[:id])
    @support.destroy
    redirect_to user_mypage_path(@support.user.id)
  end



  private
		def support_params
			params.require(:support).permit(:uuid, :user_id, :performer_id, :status, :email)
		end
end
