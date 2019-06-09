Rails.application.routes.draw do
  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine => '/api/doc' 

  resources :admins do
    get 'delete', on: :member
    get 'search', on: :collection
    get 'privileges', on: :member
    put 'update_privilege', on: :member
  end

  resource :basic, :wedding_basic, :workshop_basic, :location

  resources :clients, :carousels, :states, :tap_carousels, :tops, :photographs, :consults, :appointments, :movies do
    get 'delete', on: :member
  end

  resources :menus, :tap_carousel_photographs do
    get 'delete', on: :member
    get 'detail', on: :member
    get 'new_detail', on: :member
    post 'create_detail', on: :member
    get 'delete_detail', on: :member
    get 'show_detail', on: :member
  end

  resources :comments do
    get 'delete', on: :member
  end

  devise_for :users, path: "", path_names:{ sign_in: 'login', sign_out: 'logout' }
  root "welcomes#index"
end
