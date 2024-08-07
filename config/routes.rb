Rails.application.routes.draw do
  root to: "memos#index"
  post '/', to: 'memos#create'
  get 'signup', to: 'users#signup', as: 'signup'
  post 'signup', to: 'users#create'
  resources :users, only: [:signup, :create]
  get 'login', to: 'sessions#new', as: 'new_sessions'
  post 'login', to: 'sessions#create', as: 'create_sessions'
  delete 'login', to: 'sessions#destroy', as: 'destroy_sessions'
  resources :memos, only: [:index, :create, :update, :destroy, :show] do
    member do
      post 'add_memo'
    end
    collection do
      get 'search'
    end
  end
  match '*path', to: 'errors#not_found', via: :all
end