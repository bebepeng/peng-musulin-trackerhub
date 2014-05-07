require 'faraday'
require 'json'

class TrackerApi
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def get_projects
    response = Faraday.get('https://www.pivotaltracker.com/services/v5/projects', {}, 'X-TrackerToken' => token)
    JSON.parse(response.body)
  end

  def get_stories(id)
    response = Faraday.get("https://www.pivotaltracker.com/services/v5/projects/#{id}/stories", {}, 'X-TrackerToken' => token)
    JSON.parse(response.body)
  end
end