Rails.application.routes.draw do
  resources :promises

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get "promises/:id/congrats" => "promises#congrats"
  get "promises/:id/punishment" => "promises#punishment"
  post "promises/:id/edit" => "promises#update"

  root 'promises#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
