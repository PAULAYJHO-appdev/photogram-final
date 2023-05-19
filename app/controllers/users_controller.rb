class UsersController < ApplicationController
  def index
    @users = User.all.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end

  def authenticate
    render({ :template => "user_templates/signin_form.html.erb"})
  end

  def new_registration_form
    render({ :template => "user_templates/signup_form.html.erb"})
  end
end
