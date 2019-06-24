Rails.application.routes.draw do
  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine => '/api/doc' 

  resources :admins do
    get 'delete', on: :member
    get 'search', on: :collection
    get 'privileges', on: :member
    put 'update_privilege', on: :member
  end

  resource :basic, :wedding_basic, :workshop_basic, :location, :weixin_basic

  resources :tap_sorts, :official_accounts, :home_photograph_categories, :recents, :clients, :carousels, :states, :tap_carousels, :tops, :photographs, :consults, :appointments, :movies do
    get 'delete', on: :member
  end

  resources :tops do
    get 'set_weight', on: :member
    get 'delete', on: :member
  end
  
  resources :tap_photographs do
    get 'delete', on: :member
    resources :tap_photograph_images do
      get 'delete', on: :member
    end
  end

  resources :menus do
    get 'delete', on: :member
    resources :menu_details do
      get 'delete', on: :member
    end
  end

  resources :comments do
    get 'delete', on: :member
  end

  resources :affairs do
    get 'delete', on: :member
    resources :affair_images do
      get 'delete', on: :member
    end
    resources :affair_comments do
      get 'delete', on: :member
    end
  end

  devise_for :users, path: "", path_names:{ sign_in: 'login', sign_out: 'logout' }
  root "welcomes#index"
end
