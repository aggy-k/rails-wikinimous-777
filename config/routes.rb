Rails.application.routes.draw do
  root to: 'articles#index'

  resources :articles, except: [:index]
  get 'articles/:id/publish', to: 'articles#publish', as: 'publish_article'
end
