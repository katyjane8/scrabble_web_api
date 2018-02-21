Rails.application.routes.draw do
  root "welcome#index"

  post '/' => "welcome#index"
end
