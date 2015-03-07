class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  if Rails.env.development?
    # https://github.com/RailsApps/rails-devise-pundit/issues/10
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private
    def user_not_authorized
      flash[:alert] = "Access denied." # TODO: make sure this isn't hard coded English.
      redirect_to (request.referrer || root_path) # Send them back to them page they came from, or to the root page.
    end
  end 

  def after_sign_in_path_for(resource)
    '/dashboard'
  end
  def after_sign_up_path_for(resource)
    '/dashboard'
  end
  def after_sign_out_path_for(resource)
    '/'
  end
  

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:account_update) << :name
    end

end
