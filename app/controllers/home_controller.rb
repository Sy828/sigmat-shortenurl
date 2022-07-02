class HomeController < ApplicationController
  def index
    @link = Link.new
  end

  def stats
    @analytics = Link.fetch_analytics_data(request.base_url)
  end
end
