Rails.application.routes.draw do
  resources :portfolio_posts, except: [:show]
  get 'portfolio_angular_items', to: 'portfolio_posts#angular_scope', as: 'angular_portfolio'
  get 'portfolio_post/:id', to: 'portfolio_posts#show', as: 'portfolio_post_show'
  
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
  	member do
  		get :toggle_status
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
