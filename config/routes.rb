Rails.application.routes.draw do
  resources :cats, only: [:show, :index] do
    resources :feedback, only: [:create, :show, :index]
  end
end
