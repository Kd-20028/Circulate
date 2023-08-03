Rails.application.routes.draw do
  resources :comments
  get 'search', to: "search#index"
  root 'pages#home'
  resources :posts do
    resources :comments
  end

  resources :group_ownerships

  resources :groups do
    resources :group_memberships, only: [:create]
    put '/approve_membership/:id', to: 'group_memberships#approve', as: :approve_membership
    put '/reject_membership/:id', to: 'group_memberships#reject', as: :reject_membership
  end

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
