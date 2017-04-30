Rails.application.routes.draw do
  get 'item/index'

  get 'item/show'

  get 'item/new'

  get 'item/create'

  get 'item/edit'

  get 'item/update'

  get 'item/destroy'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
