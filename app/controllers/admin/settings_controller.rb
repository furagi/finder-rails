class Admin::SettingsController < ApplicationController

  respond_to :json

  inherit_resources

  before_action :require_user

  actions :index, :show, :update

  protected
    def permitted_params
      {setting: params.permit(:value)}
    end
end
