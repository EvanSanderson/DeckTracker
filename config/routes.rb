Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  resources :players do
    resources :decks do
        resources :cards
        resources :matchups do
        put "increment_wins", on: :member
        put "increment_losses", on: :member
      end
    end
  end

  get '/welcome' => "welcome#index"
  get '/decks' => "decks#all_index"

end
