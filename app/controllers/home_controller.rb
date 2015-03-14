class HomeController < ApplicationController
  def index
    redis = Redis.new
    @views = redis.get("views").to_i + 1
    redis.set("views", @views)
    @arbitrary = ArbitraryCounter.first_or_create.counter
  end
end
