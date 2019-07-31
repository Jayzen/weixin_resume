Rails.application.routes.draw do
  get 'homes/index'
  get 'welcomes/index'
  mount API::Base => '/api'
  mount GrapeSwaggerRails::Engine => '/api/doc' 

  resources :admins do
    get 'delete', on: :member
    get 'search', on: :collection
    get 'privileges', on: :member
    put 'update_privilege', on: :member
  end

  resource :basic, :wedding_basic, :workshop_basic, :location, :weixin_basic

  resource :merchant_basic do
    resources :merchant_basic_images do
      get 'delete', on: :member
    end
  end

  resources :product_homes, :hot_words, :merchant_images, :independent_carousels, :contacts, :home_photographs, :official_accounts, :home_photograph_categories, :recents, :clients, :carousels, :states, :tap_carousels, :tops, :photographs, :consults, :appointments, :movies do
    get 'delete', on: :member
  end

  resources :guests do
    get 'delete', on: :member
    resources :guest_comments do
      get 'delete', on: :member
    end
    resource :guest_address do
      get 'delete', on: :member
    end
    resources :orders do
      get 'delete', on: :member
      get 'refund', on: :member
      get 'refuse_refund', on: :member
      get 'revert_refund', on: :member
    end
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

  resources :sorts do
    get 'delete', on: :member
    resources :product_sorts do
      get 'delete', on: :member
    end
  end

  resources :menus do
    get 'delete', on: :member
    resources :menu_details do
      get 'delete', on: :member
    end
  end

  resources :products do
    get 'delete', on: :member
    resources :product_images do
      get 'delete', on: :member
    end
    resources :product_details do
      get 'delete', on: :member
    end
    resources :product_attributes do
      get 'delete', on: :member
    end
    resources :product_comments do
      get 'delete', on: :member
    end
    resources :product_likes do
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

  resources :banners do
    get 'delete', on: :member
    resources :banner_items do
      get 'delete', on: :member
    end
  end 
  
  resources :themes do
    get 'delete', on: :member
    resources :product_themes do
      get 'delete', on: :member
    end
  end

  devise_for :users, path: "", path_names:{ sign_in: 'login', sign_out: 'logout' }
  root "welcomes#index"
end
