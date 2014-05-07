require 'spec_helper'

describe TrackerApi do
  before do
    @tracker = TrackerApi.new(ENV['TRACKER_TOKEN'])
  end
  it 'returns an array of projects' do
    VCR.use_cassette('trackerapi/projects') do
      projects = @tracker.get_projects
      projects.map! { |project| project['name'] }

      expect(projects).to include('Listen To')
      expect(projects).to include("Bebe's User Authentication")
    end
  end

  it 'returns an array of stories' do
    VCR.use_cassette('trackerapi/stories') do
      stories = @tracker.get_stories('1075508')
      stories.map! { |story| story["name"] }

      expect(stories).to include('As a user, I can view all of my projects')
      expect(stories).to include('As a user, I can view all of the stories for a project')
    end
  end

  it 'returns an array of all comments associated with a project' do
    VCR.use_cassette('trackerapi/comments') do
      comments = @tracker.get_comments('1075508')
      comments.map! { |comment| comment["text"] }

      expect(comments).to include('This is a test comment on the first story')
      expect(comments).to include('This is a second test comment on the first story')
    end
  end
end
