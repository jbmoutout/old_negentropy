class ArtistsController < ApplicationController


  def index
    @artists = Artist.all
    @artists = policy_scope(Artist)
  end

  def show
    set_artist

    @related_artists = Artist.limit(4).joins(:galleries)

    authorize @related_artists

    authorize @artist
  end

  def related_artists

  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
