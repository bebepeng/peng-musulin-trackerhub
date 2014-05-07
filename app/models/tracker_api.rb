require 'faraday'
require 'json'

class TrackerApi
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def projects
    api_call
  end

  def stories(project_id)
    api_call("/#{project_id}/stories")
  end

  def comments(project_id)
    stories(project_id).each_with_object([]) do |story, comments|
      comments.concat api_call("/#{project_id}/stories/#{story["id"]}/comments")
    end
  end

  private

  def api_call(url='')
    response = Faraday.get('https://www.pivotaltracker.com/services/v5/projects' + url, {}, 'X-TrackerToken' => token)
    JSON.parse(response.body)
  end
end