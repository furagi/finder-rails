class Admin::GirlsController < ApplicationController

  respond_to :json

  inherit_resources

  before_action :require_user

  actions :index, :create, :update, :destroy


  private
    def permitted_params
      {:girl => params.permit(:name, :description, :main_photo_id, category_ids: []) }
    end
end
