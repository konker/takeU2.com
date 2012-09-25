class HomeController < ApplicationController
  def index
    @foo = ENV['config.foo']
    @bar = ENV['config.bar']
    @qux = ENV['config.baz.qux']
  end
end
