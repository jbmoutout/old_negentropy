
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
    @tweets = policy_scope(Artwork)
  end

  def show
  end

  def artwork_params
  params.require(:artwork).permit(:name, :date, :description, :picture)
  end
end
