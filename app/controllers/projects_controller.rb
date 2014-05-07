class ProjectsController < ApplicationController
  def index
    tracker = TrackerApi.new(ENV['TRACKER_TOKEN'])

    @projects = tracker.get_projects
  end

  def show
    tracker = TrackerApi.new(ENV['TRACKER_TOKEN'])
    @stories = tracker.get_stories(params[:id])
    @comments = tracker.get_comments(params[:id])
  end
end
