class HomeController < ApplicationController
  def index
    redis = Redis.new
    @views = redis.get("views").to_i + 1
    redis.set("views", @views)
  end
end
