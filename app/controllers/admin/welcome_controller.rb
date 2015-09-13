class Admin::WelcomeController < ApplicationController

  before_action :require_user

  def index
    @title = 'ADMIN'
    @socials = Settings.finder.socials
  end
end
