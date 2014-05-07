Rails.application.routes.draw do
  root "welcome#index"
  get "/projects" => "projects#index", :as => 'projects'
  get "/projects/:id" => "projects#show"
end
