class HomeController < ApplicationController
  def index
    @foo = Rails.application.config.foo
  end
end
