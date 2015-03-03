class DialogsController < ApplicationController

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
    @dialogs = policy_scope(Dialog)
    @user = current_user
  end

  def show
  end
end
