Rails.application.routes.draw do
  root "boards#index"
  resources :boards, only: [:index, :show] do
    resources :topics, only: [:index, :show, :new, :create] do
      resources :posts, only: [:index, :new, :create]
    end
  end
end
