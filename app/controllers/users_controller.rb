class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end

  def feed

    render({ :template => "user_templates/feed.html.erb"})
  end
 

end
