Rails.application.routes.draw do
  # 註冊／登入
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  # 自訂詞彙
  resources :customs, except: :show

  # 詞彙庫
  resources :libraries, only: :index
  
  # 關於
  resources :about, only: :index

end
