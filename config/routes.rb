Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", change_password: "registrations" }

  root 'products#index'

  namespace :account do
    resources :orders
    resources :posts
    resources :comments
    resources :users do
      member do
        get :change_password
      end
    end

  end

  namespace :admin do
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

  resources :products do
    resources :comments
    resources :posts do
      resources :comments
    end
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  resources :cart_items

end
