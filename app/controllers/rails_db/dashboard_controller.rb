module RailsDb
  class DashboardController < RailsDb::ApplicationController
    helper :all

    def index
      render :text => current_user
    end

  end
end
