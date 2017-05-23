class RepliesController < ApplicationController

  def create
      @request = Request.find(params[:request_id])
      @reply = @request.replies.build(reply_params)


        if current_user
          @reply.user_id = current_user.id
          if @reply.save
           redirect_to request_path(@request)
          else
           redirect_to request_path(@request)
          end
        else
          @reply.performer_id = current_performer.id
          if @reply.save
            redirect_to request_path(@request)
          else
            redirect_to request_path(@request)
          end
        end
      end


    private

        def reply_params
          params.require(:reply).permit(:request_id, :user_id, :performer_id, :content)
        end
end
