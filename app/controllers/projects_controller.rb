class ProjectsController < ApplicationController
  def index
    tracker = TrackerApi.new(ENV['TRACKER_TOKEN'])

    @projects = tracker.projects
  end

  def show
    tracker = TrackerApi.new(ENV['TRACKER_TOKEN'])
    @stories = tracker.stories(params[:id])
    @comments = tracker.comments(params[:id])
    github = GithubApi.new(@comments)
    @github_comments = github.comments
  end
end
