Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "html_first#home", as: :html_first_root
  get "/resources" => "html_first#resources", as: "html_first_resources"
    
end