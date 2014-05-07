require 'faraday'
require 'json'

class TrackerApi
  attr_reader :token

  def initialize(token)
    @token = token
  end

  def projects
    response = Faraday.get('https://www.pivotaltracker.com/services/v5/projects', {}, 'X-TrackerToken' => token)
    JSON.parse(response.body)
  end

  def stories(id)
    response = Faraday.get("https://www.pivotaltracker.com/services/v5/projects/#{id}/stories", {}, 'X-TrackerToken' => token)
    JSON.parse(response.body)
  end

  def comments(id)
    stories(id).each_with_object([]) do |story, comments|
      response = Faraday.get("https://www.pivotaltracker.com/services/v5/projects/#{id}/stories/#{story["id"]}/comments", {}, 'X-TrackerToken' => token)
      comments.concat JSON.parse(response.body)
    end
  end
end