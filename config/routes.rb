Rails.application.routes.draw do

  root 'recommends#index'
  get 'index' => 'recommends#index'
  resources :wardrobes, only:[:index,:show,:create,:new,:destroy]
  resources :user_choises, only:[:index,:show,:create,:new]
  resources :clothings, only:[:index,:show]

  devise_for :users, controllers: { :registrations => "users/registrations", sessions: 'users/sessions' }

  namespace :admin,path: Rails.application.secrets["admin_path"] do
    root 'admin#index'
    resources :clothings
    resources :clothing_attrs
    resources :clothing_fields

    resources :users
    resources :wardrobes
    resources :user_choises

    resources :recommends
  end
end
