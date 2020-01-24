Rails.application.routes.draw do

  devise_for :users
  get 'static_pages/home'
  root 'products#index'
  get  'signup', to: 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # public panel
  resources :products do
    member do
      post :favorite
      post :unfavorite
    end
  end
  resources :orders
  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

  # admin panel
  namespace :admin, path: :make_backend_url_abstruse do
    resources :products

    resources :promotionals

    resources :users do
      collection do
        get :admin
      end
    end

    resources :vendors do
      member do
        post :update_state
      end
    end
    root "products#index"
  end

end
