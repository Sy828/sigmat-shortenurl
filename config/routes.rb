Rails.application.routes.draw do
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/links" =>   "links#create"

  get "/:lookup_code" => "links#show"

  get "/home/stats" => "home#stats"

end
