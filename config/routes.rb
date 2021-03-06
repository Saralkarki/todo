Rails.application.routes.draw do
  devise_for :users
  resources :todo_lists do
    member do
      patch :complete
    end

    member do
      patch :incomplete
    end

  # To do items are nested under the todo_list
  # we do this because the todo_items belongs to a list. There should be a todo list first, before there can be a todo item. 
    resources :todo_items do
      member do
        patch :complete
      end
    end
    resources :todo_items do
      member do
          patch :incomplete
      end
  end 
  end

  root "todo_lists#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
