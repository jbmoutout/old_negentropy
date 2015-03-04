module Account
  class EmailsController < ApplicationController
    before_action :set_user

    def edit
    end

    def update
      if @user.update(user_params)
        flash[:notice] = "Email successfully saved."
        redirect_to root_path
      else
        flash[:alert] = "Unable to save your email."
        render :edit
      end
    end

  private

    def user_params
      params.require(:user).permit(:email)
    end

    def set_user
      @user = current_user
    end
  end
end