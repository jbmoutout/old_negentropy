
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
    @tweets = @client.user_timeline("nonprintingc")
  end

  def show
  end
end
