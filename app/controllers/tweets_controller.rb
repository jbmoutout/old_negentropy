class TweetsController < ApplicationController

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
    @tweets = policy_scope(Tweet)
    @user = current_user
  end

  def show
  end



end
