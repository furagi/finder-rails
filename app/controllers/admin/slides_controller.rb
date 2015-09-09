class Admin::SlidesController < InheritedResources::Base

  actions :index, :create, :destroy

  respond_to :json

  private
    def permitted_params
      params.permit(:file)
    end
end
