Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/create'

  get 'comments/delete'

  get 'comments/update'

  get 'comments/edit'

  get 'comments/show'

  get 'contacts/create'

  get 'contacts/index'

  

  get 'images/upload'

  get 'images/index'

  get 'images/create'

  get 'images/show'

  get 'users/logout'
  post 'contacts/delete_contact'
  #get 'contacts/delete'

  get 'users/login'

  get 'users/commants'
  get 'users/index'
  post 'users/commants'
  get 'users/accept'
  get 'users/deletecmd'

  get 'users/register'

  post 'users/register'

  post 'users/index'

  post 'users/user_login'

  post 'users/image'
  get 'users/image'
  
  post 'photos/new'

  post 'photos/command'
  
  resources :photos
  resources :contacts
namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
        post 'users/image'
        get 'photos/show1'
        get 'photos/allphoto'
        post 'contacts/create'
        get 'copntacts/delete'
        post 'photos/comment'
        get 'photos/accept'
        post 'photos/comm'
        resources :photos
        resources :users
    end
  end
namespace :api, defaults: {format: 'json'} do
    namespace :v2 do
        post 'users/image'
        get 'photos/show1'
        get 'photos/allphoto'
        post 'contacts/create'
        resources :photos
        resources :users
    end
  end
root to: 'users#login'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
