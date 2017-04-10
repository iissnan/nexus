require 'api_constraints'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, param: :name, constraints: { name: %r{[^\/]+} } do
        post 'sn', to: 'serial_numbers#create'
      end

      resources :teams
      resources :matches do
        resources :goals
      end

      post 'login', to: 'authentications#ldap'
    end
  end
end
