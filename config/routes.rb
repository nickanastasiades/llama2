Rails.application.routes.draw do

  root to: "projects#index"
  # Routes for the Company resource:
  # CREATE
  get "/companies/new", :controller => "companies", :action => "new"
  post "/create_company", :controller => "companies", :action => "create"

  # READ
  get "/companies", :controller => "companies", :action => "index"
  get "/companies/:id", :controller => "companies", :action => "show"

  # UPDATE
  get "/companies/:id/edit", :controller => "companies", :action => "edit"
  post "/update_company/:id", :controller => "companies", :action => "update"

  # DELETE
  get "/delete_company/:id", :controller => "companies", :action => "destroy"
  #------------------------------

  # Routes for the Subscription resource:
  # CREATE
  get "/subscriptions/new", :controller => "subscriptions", :action => "new"
  post "/create_subscription", :controller => "subscriptions", :action => "create"

  # READ
  get "/subscriptions", :controller => "subscriptions", :action => "index"
  get "/subscriptions/:id", :controller => "subscriptions", :action => "show"

  # UPDATE
  get "/subscriptions/:id/edit", :controller => "subscriptions", :action => "edit"
  post "/update_subscription/:id", :controller => "subscriptions", :action => "update"

  # DELETE
  get "/delete_subscription/:id", :controller => "subscriptions", :action => "destroy"
  #------------------------------

  # Routes for the Plan resource:
  # CREATE
  get "/plans/new", :controller => "plans", :action => "new"
  post "/create_plan", :controller => "plans", :action => "create"

  # READ
  get "/plans", :controller => "plans", :action => "index"
  get "/plans/:id", :controller => "plans", :action => "show"

  # UPDATE
  get "/plans/:id/edit", :controller => "plans", :action => "edit"
  post "/update_plan/:id", :controller => "plans", :action => "update"

  # DELETE
  get "/delete_plan/:id", :controller => "plans", :action => "destroy"
  #------------------------------

  # Routes for the Item resource:
  # CREATE
    get "/items/new/:project_id", :controller => "items", :action => "new"
    get "/items/add/:project_id", :controller => "items", :action => "add"
    post "/create_item", :controller => "items", :action => "create"
    post "/revise_item", :controller => "items", :action => "revise_item"

    # READ
    get "/items", :controller => "items", :action => "index"
    get "/items/:id", :controller => "items", :action => "show"

    # UPDATE
    get "/items/:id/edit", :controller => "items", :action => "edit"
    get "/items/revise/:project_id", :controller => "items", :action => "revise"
    post "/update_item/:project_id", :controller => "items", :action => "update"

    # DELETE
    get "/delete_item/:id", :controller => "items", :action => "destroy"
  #------------------------------

  # Routes for the Project resource:
  # CREATE
  get "/projects/start", :controller => "projects", :action => "start"
  get "/projects/new", :controller => "projects", :action => "new"
  post "/create_project", :controller => "projects", :action => "create"
  get "/projects/review/:id", :controller => "projects", :action => "review"
  get "/projects/revise-submit/:id", :controller => "projects", :action => "revise_submit"
  # READ
  get "/dashboard", :controller => "projects", :action => "index"
  get "/projects", :controller => "projects", :action => "index"
  get "/projects/:id", :controller => "projects", :action => "show"

  # UPDATE
  get "/projects/:id/edit", :controller => "projects", :action => "edit"
  post "/update_project/:id", :controller => "projects", :action => "update"

  # DELETE
  get "/delete_project/:id", :controller => "projects", :action => "destroy"
  #------------------------------

  devise_for :designers
  devise_for :clients, :controllers => { :registrations => "clients/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
