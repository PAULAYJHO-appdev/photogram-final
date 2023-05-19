Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #Homepage
  get("/", { :controller => "users", :action => "index" })

  #Users
  get("/users", { :controller => "users", :action => "index" })

  #Photos
  get("/photos", { :controller => "photos", :action => "index" })


  #Sign In


  #Sign Up
end
