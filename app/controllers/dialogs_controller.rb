class DialogsController < ApplicationController
  skip_after_action :verify_authorized, only: :collection
  skip_before_action :authenticate_user!

  def index
    @dialogs = policy_scope(Dialog)
    #Working on Heroku (without pagination) :
    #@dialogs = Dialog.order('origin_date DESC').includes(:artwork)
    #Need to be fixed (working on local, not on Heroku) :
    @dialogs = Dialog.order('origin_date DESC').includes(:artwork).page(params[:page])


    @artists = Artist.all
  end

  def collection
    @dialogs = current_user.find_voted_items
  end

  def related_artists
    @related_artists = []

    if @artist.galleries.any?
      @galleries = @artist.galleries

      @galleries.each do |gallery|
        @related_artists += gallery.artists.joins(:galleries).distinct
      end
    end

    @related_artists.uniq!

    authorize @artist
    end


  def add
    set_dialog
    @dialog.liked_by current_user
    redirect_to collection_path
    authorize @dialog
  end

  def remove
    set_dialog
    @dialog.unliked_by current_user
    redirect_to collection_path
    authorize @dialog
  end



  private

  def set_dialog
    @dialog = Dialog.find(params[:dialog_id])
  end
end
