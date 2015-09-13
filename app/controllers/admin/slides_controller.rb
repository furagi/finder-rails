class Admin::SlidesController < ApplicationController

  respond_to :json

  inherit_resources

  before_action :require_user

  actions :index, :create, :destroy


  private
    def permitted_params
      {slide: {image: params.permit(:file)[:file]}}
    end
end
