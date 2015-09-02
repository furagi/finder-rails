class WelcomeController < ApplicationController
  def index
    @title = Settings.application.title
    @categories = Category.all
    @slides = Slide.all
    @girls = Girl.all
  end
end
