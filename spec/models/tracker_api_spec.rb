require 'spec_helper'

describe TrackerApi do
  before do
    @tracker = TrackerApi.new(ENV['TRACKER_TOKEN'])
  end
  it 'returns an array of projects' do
    VCR.use_cassette('trackerapi/projects') do
      projects = @tracker.get_projects
      project_names = projects.map { |project| project['name'] }

      expect(project_names).to include('Listen To')
      expect(project_names).to include("Bebe's User Authentication")
    end
  end

  it 'returns an array of stories' do
    VCR.use_cassette('trackerapi/stories') do
      stories = @tracker.get_stories('1075508')
      story_names = stories.map { |story| story["name"] }

      expect(story_names).to include('As a user, I can view all of my projects')
      expect(story_names).to include('As a user, I can view all of the stories for a project')
    end
  end

  it 'returns an array of all comments associated with a project' do
    VCR.use_cassette('trackerapi/comments') do
      comments = @tracker.get_comments('1075508')
      comment_texts = comments.map { |comment| comment["text"] }

      expect(comment_texts).to include('This is a test comment on the first story')
      expect(comment_texts).to include('This is a second test comment on the first story')
    end
  end
end
