class Admin::SettingsController < InheritedResources::Base

  respond_to :json
  actions :index, :show, :update

  # def index
  #   respond_with FinderSetting.all
  # end

  # def show
  #   respond_with FinderSetting.find params[:id]
  # end

  # def update
  #   respond_with FinderSetting.update(params[:id], permitted_params)
  # end

  protected
    def permitted_params
      {setting: params.permit(:value)}
    end
end
