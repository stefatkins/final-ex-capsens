Rails.application.routes.draw do
  root 'items#index'
  resources :items do
    collection do
      get 'next_day'
      get 'toggle_drunk_mode'
    end  
  end
end
