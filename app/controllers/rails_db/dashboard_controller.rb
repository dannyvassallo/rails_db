include RailsDb::ApplicationHelper

module RailsDb
  class DashboardController < RailsDb::ApplicationController

    def index
      render :text => session
    end

  end
end
