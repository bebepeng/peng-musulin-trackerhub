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

  def stories(id)
    api_call("/#{id}/stories")
  end

  def comments(id)
    stories(id).each_with_object([]) do |story, comments|
      comments.concat api_call("/#{id}/stories/#{story["id"]}/comments")
    end
  end

  private

  def api_call(url='')
    response = Faraday.get('https://www.pivotaltracker.com/services/v5/projects' + url, {}, 'X-TrackerToken' => token)
    JSON.parse(response.body)
  end
end