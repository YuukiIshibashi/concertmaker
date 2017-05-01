Rails.application.routes.draw do

  root 'top#index'

  devise_for :performers, controllers: {
  sessions:      'performers/sessions',
  passwords:     'performers/passwords',
  registrations: 'performers/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  resources :performer_mypage, only: [:index]
  resources :candidacy

  resources :musician, only: [:index, :show] do
    collection do
      get :search
      get :profile
    end
  end

  resources :top, only: [:index]
  resources :past_event
  resources :event
  resources :user_mypage, only: [:index]
  resources :top, only: [:index]
  resources :commet, only: [:new, :create, :destroy]
end
