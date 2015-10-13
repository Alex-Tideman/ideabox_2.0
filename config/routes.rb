Rails.application.routes.draw do
  root 'ideas#index'
  resources :ideas
  resources :quality do
    member do
      put 'up'
      put 'down'
    end
  end


end
