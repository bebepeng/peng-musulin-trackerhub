require 'spec_helper'

describe TrackerApi do
  before do
    @tracker = TrackerApi.new(ENV['TRACKER_TOKEN'])
  end
  it 'returns an array of projects' do
    projects = @tracker.get_projects
    projects.map! { |project| project['name'] }

    expect(projects).to include('Listen To')
    expect(projects).to include("Bebe's User Authentication")
  end

  it 'returns an array of stories' do
    stories = @tracker.get_stories('1075508')
    stories.map! { |story| story["name"] }

    expect(stories).to include('As a user, I can view all of my projects')
    expect(stories).to include('As a user, I can view all of the stories for a project')
  end
end
