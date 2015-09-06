class Admin::GirlsController < InheritedResources::Base

  actions :index, :create, :update, :destroy

  respond_to :json

  private
    def permitted_params
      {:girl => params.permit(:name, :description, :main_photo_id, :image, category_ids: []) }
    end
end
