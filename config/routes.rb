Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  constraints(domain: /\Ahtml-first\./) do
    root to: "html_first#home", as: :html_first_root
    get "/resources" => "html_first#resources", as: "html_first_resources"
    get "/snippets/:id" => "site#show_snippet", as: "snippet"
    get "/test" => "html_first#show_doc", as: "show_doc", defaults: { file: "test.md" }
  end

  constraints(domain: /\Atailwind-lite\./) do
    root to: "tailwind_lite#home", as: :tailwind_lite_root
  end

  constraints(domain: /\Amini-js\./) do
    root to: "mini_js#show_doc", as: :mini_js_root, defaults: { file: "docs/mini_about.md" }
    get "/reference" => "mini_js#show_doc", as: "mini_js_reference", defaults: { file: "docs/mini_reference.md" }
    get "/examples" => "mini_js#show_doc", as: "mini_js_examples", defaults: { file: "docs/mini_examples.md" }
  end

  constraints(domain: /\Ah1rails\./) do
    root to: "diet_rails#show_doc", as: :diet_rails_root, defaults: { file: "home" }
    get "/demo" => "diet_rails#demo", as: "diet_rails_demo"
    match "/demo/update/:user_id" => "diet_rails#demo_update", as: "diet_rails_demo_update", via: [:get, :patch]
    get "/demo/add_category" => "diet_rails#new_category", as: "new_category"
    delete "/demo/category/:category_id/delete" => "diet_rails#delete_category", as: "delete_category"
    get "/:folder/:file"  => "diet_rails#show_doc", as: "diet_rails_doc_with_folder"
    get "/:file"          => "diet_rails#show_doc", as: "diet_rails_doc"
  end

  constraints(domain: /\Abase-styles\./) do
    get "/examples" => "base_styles#examples", as: "base_styles_examples"
    root to: "base_styles#show_doc", as: :base_styles_root, defaults: { file: "home" }
    get "/:file"          => "base_styles#show_doc", as: "base_styles_doc"
  end

  if ENV['LOCAL_DEV']
    default_url_options(host: "http://html-first.localhost")
  else 
    default_url_options(host: "https://html-first.com")
  end
end
