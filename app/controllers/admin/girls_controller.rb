class Admin::GirlsController < InheritedResources::Base

  actions :index, :create, :update, :destroy

  respond_to :json

  private
    def permitted_params
      params.require(:girl).permit(:name, :description, :main_photo, :image)
    end
end
