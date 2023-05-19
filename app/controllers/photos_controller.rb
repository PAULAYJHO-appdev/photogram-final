class PhotosController < ApplicationController
  def index
    @photos = Photo.all
    render({ :template => "photo_templates/index.html.erb"})
    end
end
