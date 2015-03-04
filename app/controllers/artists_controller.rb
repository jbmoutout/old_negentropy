class ArtistsController < ApplicationController


  def index
    @artists = Artist.all
    @artists = policy_scope(Artist)
  end

  def show
    @artist = Artist.find(params[:id])
    authorize @artist

  end
end
