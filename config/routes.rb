Rails.application.routes.draw do
  resources :service_delivery_points do
    collection do
      post 'preview'
      post 'submit'
    end
  end

  resources :operating_companies
  get '/operatingCompanies', to: 'operating_companies#index'

  namespace :api do
    resources :leads, only: [:index, :create]  # Add :index here
  end
end
