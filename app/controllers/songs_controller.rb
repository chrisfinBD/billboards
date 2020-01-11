class SongsController < ApplicationController
  def index
    @songs = Song.all.order(id: :asc)
    @artists = Artist.all
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to(songs_path) 
    else
      # if nothing was defined here, the render would reuse create
      # When using render the params is preserved. When using redirect the forms values are reset for a new session. Also whenever we change action methods
      render(:new)
    end
  end

  def new
    @song = Song.new
    @artists = Artist.all 
  end

  def edit
    @song = Song.find(params[:id])  
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to(songs_path)
    else
      render(:edit)
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to(songs_path)
  end

  private

  def song_params
    params.require(:song).permit(:title, :released_on, :genre, :rating, :artist_id)
  end
end
