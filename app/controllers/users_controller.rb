class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end

  def feed
    the_username = params.fetch("path_id")
    @user = User.where({ :username => the_username }).at(0)
    @user_feed = @user.feed
    render({ :template => "user_templates/feed.html.erb"})
  end
 
  def discover
    the_username = params.fetch("path_id")
    @user = User.where({ :username => the_username }).at(0)
    render({ :template => "user_templates/discover.html.erb"})
  end

end
