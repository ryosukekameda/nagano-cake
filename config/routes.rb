Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'admin/top' => 'admin#top', as: 'admin'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    get 'items' => 'items#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
