Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'welcome/index'
  resources :todos do
    resources :items do
      member do
        patch :complete
      end
    end
  end
  root "todos#index"
  #root 'welcome#index'
end