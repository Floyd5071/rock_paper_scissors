Rails.application.routes.draw do
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
