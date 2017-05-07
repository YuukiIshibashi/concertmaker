class UserMypageController < ApplicationController
  def show
    @user = User.find(params[:id])
    @requests = Request.where(user_id: @user.id)

  end
end
