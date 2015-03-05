class ArtistsController < ApplicationController


  def index
    @artists = Artist.all
    @artists = policy_scope(Artist)
  end

  def show

    set_artist
    @related_artists = []

    if @artist.galleries.any?
      @galleries = @artist.galleries

      @galleries.each do |gallery|
        @related_artists += gallery.artists.joins(:galleries).distinct
      end
    end

    @related_artists.uniq!

    @related_artworks = []

    @related_artists.each do |artist|
       @related_artworks += artist.artworks[0]
     end
    end

    authorize @artist
  end

  def related_artists

  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end
end
