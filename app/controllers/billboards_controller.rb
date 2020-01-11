class BillboardsController < ApplicationController
  def index
    @billboards = Billboard.all.order(id: :asc)
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to(billboards_path) 
    else
      # if nothing was defined here, the render would reuse create
      # When using render the params is preserved. When using redirect the forms values are reset for a new session. Also whenever we change action methods
      render(:new)
    end
  end

  def new
    @billboard = Billboard.new 
  end

  def edit
    @billboard = Billboard.find(params[:id])  
  end

  def update
    @billboard = Billboard.find(params[:id])
    if @billboard.update(billboard_params)
      redirect_to(billboards_path)
    else
      render(:edit)
    end
  end

  def destroy
    @billboard = Billboard.find(params[:id])
    @billboard.destroy
    redirect_to(billboards_path)
  end

  private

  def billboard_params
    params.require(:billboard).permit(:title, :country)
  end
end
