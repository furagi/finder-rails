class Admin::SettingsController < ApplicationController

  respond_to :json

  def index
    respond_with FinderSetting.all
  end

  def show
    respond_with FinderSetting.find params[:id]
  end

  def update
    respond_with FinderSetting.update(params[:id], permitted_params)
  end

  protected
    def permitted_params
      params.require(:setting).permit(:value)
    end
end
