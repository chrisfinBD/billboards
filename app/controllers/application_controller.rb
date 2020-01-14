class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_view_count_cookie
  private
  def set_view_count_cookie
    if cookies[:views]
      cookies[:views] = cookies[:views].to_i + 1
    else
      cookies[:views] = 0
    end
  end
end
