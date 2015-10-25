Rails.application.routes.draw do
  
  get 'import_file' , to: "files#new" , as: "import_file"
  resources :orders, only: [:index]
  resources :files, only: [:index, :create]
  root to: "orders#index"
end
