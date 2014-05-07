class ProjectsController < ApplicationController
  def index
    tracker = TrackerApi.new(ENV['TRACKER_TOKEN'])

    @projects = tracker.get_projects
  end
end