class DialogsController < ApplicationController

  def index
    @dialogs = policy_scope(Dialog)
  end

end
