class Admin::PhotosController < InheritedResources::Base
  actions :create, :destroy

  respond_to :json

  belongs_to :girls, :finder => :find_by_id!, :param => :girl_id

  # private
  #   def permitted_params
  #     params
  #   end
end
