class CollectionsController < ApplicationController
  before_action :authenticate_user!

  def new

    @dialog = Dialog.find(params[:dialog_id])
    @collection = @dialog.collections.build
    authorize @collection

  end

  def create
    @dialog = Dialog.find(params[:dialog_id])
    @collection = @dialog.collections.build(collection_params)
    @collection.user = current_user

  end

  def destroy
  end

  def index
    @collections = policy_scope(Collection)
  end

  def show
  end

  private


  def collection_params
    params.require(:collection).permit(:user_id, :dialog_id)
  end

end