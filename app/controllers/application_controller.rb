

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, unless: :pages_controller?

    class << self
        attr_accessor :twitter
    end

  include Pundit
  after_action :verify_authorized, except: :index, unless: :devise_or_pages_or_admin_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_or_admin_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def after_sign_up_path_for(resource)
    if resource.provider == 'twitter' && resource.email.blank?
      edit_account_email_path
    else
      signed_in_root_path(resource)
    end
  end

  def user_not_authorized
    flash[:error] = I18n.t('controllers.application.user_not_authorized', default: "You can't access this page.")
    redirect_to(root_path)
  end

  def devise_or_pages_or_admin_controller?
    devise_controller? || pages_controller? || admin_controller?
  end

  def admin_controller?
    controller_path.start_with?('admin/')
  end

  def pages_controller?
    controller_name == "pages"  # Brought by the `high_voltage` gem
  end
end
