Rails.application.routes.draw do
  resources :users, only: :none do
    collection do
      post "sign_in"
    end
  end

  resources :feeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
