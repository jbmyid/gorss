class ApplicationController < ActionController::Base
  protect_from_forgery
  # before_filter :authenticate_user!

  def current_user
  	super || current_admin
  end
end
