Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "html_first#home"
  get "/guidelines" => "html_first#guidelines", as: "guidelines"
  get "/resources" => "html_first#resources", as: "resources"
    
end