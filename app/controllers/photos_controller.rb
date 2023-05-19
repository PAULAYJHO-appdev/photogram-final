class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order(created_at: :desc)
    render({ :template => "photo_templates/index.html.erb"})
    end
end
