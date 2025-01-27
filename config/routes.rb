Rails.application.routes.draw do

  root to: "check#index"
  # 註冊／登入
  get "signup", to: "registrations#new"
  post "signup", to: "registrations#create"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # 錯字檢查
  resources :check, only: [:index] do
    post :examine, on: :collection
  end
  
  # 自訂詞彙
  resources :customs, except: :show

  # 詞彙庫
  resources :libraries, only: :index

  # 回報
  resources :reports, only: [:index, :new, :create, :edit, :update] do
    get 'words/:category', to: 'reports#words', on: :collection
  end
  
  # 關於
  resources :about, only: :index

end
