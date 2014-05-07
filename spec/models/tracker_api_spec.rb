require 'spec_helper'

describe TrackerApi do
  it 'returns an array of projects' do
    tracker = TrackerApi.new(ENV['TRACKER_TOKEN'])
    projects = tracker.get_projects
    projects.map! { |project| project['name'] }

    expect(projects).to include('Listen To')
    expect(projects).to include("Bebe's User Authentication")
  end
end
