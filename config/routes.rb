Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guests, only: [:index, :show, :new, :edit, :create, :update]
  resources :episodes, only: [:index, :show, :new, :edit, :create, :update]
  resources :appearances, only: [:index, :show, :new, :edit, :create, :update]
end
