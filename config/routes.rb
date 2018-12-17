Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "rates", to: "application#rates"
  get "uf", to: "application#uf"

end
