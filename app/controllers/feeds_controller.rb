class FeedsController < ApplicationController
  skip_before_filter :authenticate_user!
  def show
    @feed = Feed.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end
end
