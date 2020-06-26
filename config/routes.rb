Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guests
  resources :episodes
  resources :appearances
end

# , only: [:index, :show]
# , only: [:index, :show]
# , only: [:index, :new, :create, :edit, :show, :update]