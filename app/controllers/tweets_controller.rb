class TweetsController < ApplicationController
  
  def index
    # two-part solution: page-level caching, and using render_async with a partial
  end

  def tweet
    response = HTTParty.get('http://twitter.com/newrelic')

    parsed_data = Nokogiri::HTML.parse response.body
    tweetNodes = parsed_data.css(".js-tweet-text")
    @nodes = tweetNodes.collect do |node|
      node.inner_html
    end
    render :partial => "tweet"
  end
end
