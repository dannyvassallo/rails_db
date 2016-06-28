module RailsDb
  class ApplicationController < ActionController::Base
    helper :all
    helper_method :per_page
    helper_method :current_user

    if Rails::VERSION::MAJOR >= 4
      before_action :verify_access
    else
      before_filter :verify_access
    end

    if RailsDb.http_basic_authentication_enabled
      http_basic_authenticate_with name: RailsDb.http_basic_authentication_user_name,
                                   password: RailsDb.http_basic_authentication_password
    end

    def current_user
      @current_user ||= CamaleonCms::User.find(session[:current_user]["id"]) if session[:current_user]
    end

    private

    def verify_access
      result = RailsDb.verify_access_proc.call(self)
      redirect_to('/', error: 'Access Denied', status: 401) unless result
    end

    def per_page
      params[:per_page] || session[:per_page]
    end

  end
end

