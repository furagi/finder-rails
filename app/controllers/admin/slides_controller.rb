class Admin::SlidesController < InheritedResources::Base

  actions :index, :create, :destroy

  respond_to :json

  private
    def permitted_params
      {slide: {image: params.permit(:file)[:file]}}
    end
end
