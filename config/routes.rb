Rails.application.routes.draw do
  # get 'users/index'

  # get 'users/show'

  # get 'friendships/create'

  resources :posts do
    resources :likes
  end
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: %i[index show] do
    resources :friendships, only: %i[create] do
      collection do
        get 'accept_friend'
        get 'decline_friend'
      end
    end
  end
  # get 'home/index'
  root 'home#index'
  get '/saw_notification', to: 'users#saw_notification', as: 'saw_notice'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
