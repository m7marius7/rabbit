Rails.application.routes.draw do
   root 'welcome#index'
   get 'posts/index'
  get "/about", to: "pages#about", as: :pages_about
  get "pages/search_engine_optimization", to: redirect('/search-engine-optimization-tips')
  get "search-engine-optimization-tips", to: "pages#search_engine_optimization", as: :seo_tips
  # resources :posts

  resources :posts, only: [:new, :index, :create]

  # get "posts/:id", to: redirect("/%{id}")
  # get "posts/:id", to: (lambda do |params|
  #   id = params[:id]
  #   redirect("/#{id}", status: :moved_permanently)
  # end)
  get "posts/:id", to: (lambda do |params|
    id = params[:id].strip
    redirect("/#{id}", status: :moved_permanently)
  end)
  

  resources :posts, :path=>' ', except: [:new, :index, :create]



  devise_for :users
  resources :rooms do
    resources :messages
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :tasks


  # root 'tasks#index'
  # root 'rooms#index'
end
