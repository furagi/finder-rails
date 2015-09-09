class Admin::CategoriesController < InheritedResources::Base

  actions :index, :create, :update, :destroy

  respond_to :json

  private
    def permitted_params
      {:category => params.permit(:name)}
    end

end
