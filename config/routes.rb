# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root to: redirect('/api-docs')
  namespace :api do
    namespace :v1 do
      namespace :user_space do
        resources :games, only: [] do
          collection do
            get :play
          end
        end
      end
    end
  end
end
