Rails.application.routes.draw do
  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine => '/api/doc' 

  resources :admins do
    get 'delete', on: :member
    get 'search', on: :collection
  end

  resources :basics do
    get 'delete', on: :member
  end

  devise_for :users, path: "", path_names:{ sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root "welcomes#index"
end
