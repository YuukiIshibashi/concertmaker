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
  resources :performer_mypage, only: [:show]
  resources :candidacy

  resources :musician, only: [:index, :show] do
    collection do
      get :search
    end
  end

  resources :request, only: [:create, :destroy, :show] do
    resources :reply, only: [:create, :destroy]
  end

  resources :top, only: [:index]
  resources :past_event
  resources :event
  resources :user_mypage, only: [:show]
  resources :top, only: [:index]
  resources :commet, only: [:new, :create, :destroy]
end
