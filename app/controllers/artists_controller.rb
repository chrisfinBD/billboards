class ArtistsController < ApplicationController

  def index
    @artists = Artist.all.order(id: :asc)
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to(artists_path) 
    else
      # if nothing was defined here, the render would reuse create
      # When using render the params is preserved. When using redirect the forms values are reset for a new session. Also whenever we change action methods
      render(:new)
    end
  end

  def new
    if current_user && current_user.standard?
      render(plain: "You must be an artist to create new artists.", status: 403)
    end
    @artist = Artist.new 
  end

  def edit
    #authorize
    if current_user && current_user.standard?
      render(plain: "You must be an artist to edit artists.", status: 403)
   end
    @artist = Artist.find(params[:id])  
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to(artists_path)
    else
      render(:edit)
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to(artists_path)
  end

  private

  def artist_params
    params.require(:artist).permit(:name)
  end
  
  def authorize
    if current_user && current_user.standard?
      render(plain: "You must be an artist to edit or create new artists.", status: 403)
    end
  end

end
