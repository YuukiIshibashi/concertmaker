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
  resources :performer_mypage, only: [:show, :new, :create]
  resources :candidacies
  resources :supports, only: [:show, :new, :create, :destroy] do
    collection do
      get :update
    end
  end

  resources :musicians, only: [:index, :show], shallow: true do
    collection do
      get :search
      get :event
    end
  end

  resources :requests, only: [:create, :destroy, :show] do
    resources :replies, only: [:create, :destroy]
  end

  resources :top, only: [:index]
  resources :past_events
  resources :events
  resources :user_mypage, only: [:show]
  resources :top, only: [:index]
  resources :comments, only: [:new, :create, :destroy]
end
