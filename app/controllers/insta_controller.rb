class InstaController < ApplicationController
  skip_after_action :verify_authorized, only: :collection
  skip_before_action :authenticate_user!

  def index
    @insta = policy_scope(Instum)
    @insta = Instum.order('created_at DESC').page(params[:page])

    @artists = Artist.all
  end

  def add
    set_instum
    @instum.liked_by current_user
    redirect_to collection_path
    authorize @instum
  end

  def remove
    set_instum
    @instum.unliked_by current_user
    redirect_to collection_path
    authorize @instum
  end

  private

  def set_instum
    @instum = Instum.find(params[:instum_id])
  end

end
