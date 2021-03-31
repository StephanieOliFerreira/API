Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :educational_institutions
      resources :students
      resources :enrollments
      resources :payments
    end
  end
end
