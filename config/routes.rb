Rails.application.routes.draw do
  resources :snotes
  resources :notes do
    resources :snotes, only: [:create]
  end
  # get 'welcome/index'
  # root 'welcome#index'

  # need both constraints to work
  constraints Clearance::Constraints::SignedIn.new do
    root to: "welcome#index", as: :signed_in_root
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: "welcome#index"
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  # root "clearance/users#new"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
