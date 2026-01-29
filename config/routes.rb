Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :issues, shallow: true do
      resources :comments, only: [:create]
    end
  end




  get "up" => "rails/health#show", as: :rails_health_check

end
