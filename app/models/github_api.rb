require 'faraday'
require 'json'

class GithubApi
  attr_reader :tracker_comments

  def initialize (tracker_comments)
    @tracker_comments = tracker_comments
  end

  def comments
    relevent_comments = tracker_comments.select { |comment| comment.has_key?("text") && comment["text"].include?("Commit by") }
    relevent_comments.each_with_object([]) do |comment, comments_array|
      body_parsed = comment['text'].split('/')
      git_username = body_parsed[3]
      git_repo = body_parsed[4]
      git_sha = comment["commit_identifier"]

      response = connect("/repos/#{git_username}/#{git_repo}/commits/#{git_sha}/comments")
      comments_array.concat(JSON.parse(response.body))
    end
  end

  private

  def connect(url)
    faraday = Faraday.new(:url => "https://api.github.com") do |f|
      f.adapter(Faraday.default_adapter)
      f.basic_auth(ENV['GITHUB_USERNAME'], ENV['GITHUB_PASSWORD'])
    end
    faraday.get(url)
  end
end
