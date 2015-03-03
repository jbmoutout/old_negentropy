
class ArtworksController < ApplicationController


  def new

  end

  def create
  end


  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @artwork = Artwork.find(params[:id])
    authorize @artwork
  end


end
