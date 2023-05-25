class PhotosController < ApplicationController
  def index
    @list_of_photos = Array.new
    matching_photos = Photo.all
    
    matching_photos.each do |photo|
      if photo.poster.private == false
        @list_of_photos.push(photo)
      end
    end

    @list_of_photos = @list_of_photos.sort_by { |photo| photo.created_at }.reverse
    #To display form
    @user = User.where(id: params[:user_id]).first
    
    render({ :template => "photos/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => the_id })
    @the_photo = matching_photos.at(0)
    @current_user_id = session[:user_id]
    if session[:user_id].nil?
      redirect_to("/user_sign_in", { :alert => "You have to sign in first." })
    else
      render({ :template => "/photos/show.html.erb" }) # Render show template for the_photo
    end

  end

  def create
    the_photo = Photo.new
    the_photo.caption = params.fetch("query_caption")
    the_photo.comments_count = params.fetch("query_comments_count")
    the_photo.image = params.fetch("query_image")
    the_photo.likes_count = params.fetch("query_likes_count")
    the_photo.owner_id = params.fetch("query_owner_id")

    if the_photo.valid?
      the_photo.save
      redirect_to("/photos", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos", { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    the_photo.caption = params.fetch("query_caption")
    the_photo.comments_count = params.fetch("query_comments_count")
    the_photo.image = params.fetch("query_image")
    the_photo.likes_count = params.fetch("query_likes_count")
    the_photo.owner_id = params.fetch("query_owner_id")

    if the_photo.valid?
      the_photo.save
      redirect_to("/photos/#{the_photo.id}", { :notice => "Photo updated successfully."} )
    else
      redirect_to("/photos/#{the_photo.id}", { :alert => the_photo.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_photo = Photo.where({ :id => the_id }).at(0)

    the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end
end
