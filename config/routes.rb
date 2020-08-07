Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'pages/index'
  get 'pages/home'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :likes, only: %i(create destroy)
  # ここまで追加
  resources :posts, only: %i(new create index) do
      resources :photos, only: %i(create)
  end


  get '/users/:id', to: 'users#show', as: 'user'
  resources :comments, only: [:create, :destroy]

end
