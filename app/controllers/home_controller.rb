class HomeController < ApplicationController
  def index
    @foo = ENV['config.foo']
  end
end
