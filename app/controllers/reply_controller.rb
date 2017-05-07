class ReplyController < ApplicationController

  def create
      @request = Request.find(params[:id])
      @reply = @request.replies.build(reply_params)


        if current_user
          @reply.user_id = current_user.id
          if @reply.save
           redirect_to user_mypage_path(current_user.id)
          else
           redirect_to user_mypage_path(current_user.id)
          end
        else
          @reply.performer_id = current_performer.id
          if @reply.save
            redirect_to performer_mypage_path(current_performer.id)
          else
            redirect_to performer_mypage_path(current_performer.id)
          end
        end
      end


    private

        def reply_params
          params.require(:reply).permit(:request_id, :user_id, :performer_id, :content)
        end
end
