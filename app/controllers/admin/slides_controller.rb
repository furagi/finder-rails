class Admin::SlidesController < InheritedResources::Base

  actions :index, :create, :destroy

  respond_to :json

  private
    def permitted_params
      params.require(:slide).permit(:image)
    end
end
