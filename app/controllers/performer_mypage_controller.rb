class PerformerMypageController < ApplicationController
  def index
    @performer = current_performer
  end
end
