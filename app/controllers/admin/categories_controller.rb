class Admin::CategoriesController < ApplicationController

  respond_to :json

  inherit_resources

  before_action :require_user

  actions :index, :create, :update, :destroy


  private
    def permitted_params
      {:category => params.permit(:name)}
    end

end
