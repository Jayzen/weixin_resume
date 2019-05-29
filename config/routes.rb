Rails.application.routes.draw do
  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine => '/api/doc' 

  resources :admins do
    get 'delete', on: :member
    get 'search', on: :collection
    get 'privileges', on: :member
    put 'update_privilege', on: :member
  end

  resource :basic
  resource :wedding_basic
  resource :location

  resources :clients, :carousels, :photographs, :consults, :appointments do
    get 'delete', on: :member
  end

  resources :comments do
    get 'delete', on: :member
  end

  devise_for :users, path: "", path_names:{ sign_in: 'login', sign_out: 'logout' }
  root "welcomes#index"
end
