class PagesController < ApplicationController
  def index
     @billboards = Billboard.order(created_at: :desc).limit(10)
  end
end
