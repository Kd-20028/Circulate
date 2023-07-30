Rails.application.routes.draw do
  get 'search', to: "search#index"
  root 'pages#home'
  resources :posts do
    collection do
      get :new_public
      post :create_public
    end
  end

  resources :group_ownerships



  resources :groups do
    resources :posts
    resources :events do
      put :approve, on: :member
      put :reject, on: :member
    end
    post 'join', on: :member
    delete 'leave', on: :member
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
