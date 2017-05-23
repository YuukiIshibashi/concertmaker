class RequestsController < ApplicationController

  def show
    @request = Request.find(params[:id])
    # if current_user
    # @request = Request.find_by(user_id: current_user.id, performer_id: params[:performer_id])
    # elsif current_performer
    # @request = Request.find_by(user_id: params[:user_id], performer_id: current_performer.id)
    # end
    #@reply = Reply.new
    @reply = @request.replies.build


  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
    if @request.save
       redirect_to user_mypage_path(current_user.id)
    else
       redirect_to musician_path(@request.performer.id)
    end

  end


  private
    def request_params
      params.require(:request).permit(:content, :performer_id, :user_id)
    end

end
