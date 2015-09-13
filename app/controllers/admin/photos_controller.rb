class Admin::PhotosController < ApplicationController

  respond_to :json

  inherit_resources

  before_action :require_user

  actions :create, :destroy


  belongs_to :girls, :finder => :find_by_id!, :param => :girl_id

  private
    def permitted_params
      {photo: {image: params.permit(:file)[:file]}}
    end
end
