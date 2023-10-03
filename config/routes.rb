Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get '/admin' => 'homes#top', as: 'admin'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :index, :update]
    resources :order_details, only: [:update]
  end
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
    
    resources :items, only: [:index, :show]
    
  resource :customer, only: [] do
    member do
      get 'mypage', action: :show
      get 'information/edit', action: :edit
      patch 'information', action: :update
      get 'unsubscribe'
      patch 'withdraw'
    end
  end

    
    resources :cart_items, only: [:index, :update, :create, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    
    resources :orders, only: [:new, :index, :show, :create]
    post 'orders/confirm' => 'orders#confirm', as: 'orders_confirm'
    post 'complete' => 'orders#complete'
    end
  end

