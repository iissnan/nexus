require 'api_constraints'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :players,
                path: :users,
                param: :name,
                constraints: { name: %r{[^\/]+} }
      resources :teams
      resources :matches

      post 'login', to: 'authentications#login'
    end
  end
end
