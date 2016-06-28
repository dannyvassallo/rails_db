module RailsDb
  class DashboardController < RailsDb::ApplicationController

    def index
      render :text => current_user
    end

  end
end
