class WelcomeController < ApplicationController
  def index
    @title = Settings.finder.title
    @description = Settings.finder.description
    @categories = Category.all
    @slides = Slide.all
    @girls = Girl.all
  end
end
