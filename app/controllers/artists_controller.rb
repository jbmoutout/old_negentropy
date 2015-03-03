class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
    @artists = policy_scope(Artist)
  end

  def show
  end
end
