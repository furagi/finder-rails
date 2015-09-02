class Admin::WelcomeController < ApplicationController
  def index
    @title = 'ADMIN'
    @socials = Settings.finder.socials
  end
end
