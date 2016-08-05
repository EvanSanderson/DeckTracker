Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "players#index"

  resources :players do
    resources :decks do
        resources :cards
    end
  end

end
