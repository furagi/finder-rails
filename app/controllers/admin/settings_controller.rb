class Admin::SettingsController < ApplicationController

  respond_to :json

  inherit_resources

  before_action :require_user

  actions :index, :show, :update

  protected
    def permitted_params
      if params[:id] == 'socials'
        {setting: params.permit(value: [:name, :url])}
      else
        {setting: params.permit(:value)}
      end
    end
end
