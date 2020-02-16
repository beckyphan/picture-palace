Rails.application.routes.draw do
  resources :comments
  resources :reviews
  resources :events
  resources :movies
  resources :users, only: [:create, :new, :edit, :show, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

                         #        Prefix Verb   URI Pattern                           Controller#Action
                         #     comments GET    /comments(.:format)                   comments#index
                         #              POST   /comments(.:format)                   comments#create
                         #  new_comment GET    /comments/new(.:format)               comments#new
                         # edit_comment GET    /comments/:id/edit(.:format)          comments#edit
                         #      comment GET    /comments/:id(.:format)               comments#show
                         #              PATCH  /comments/:id(.:format)               comments#update
                         #              PUT    /comments/:id(.:format)               comments#update
                         #              DELETE /comments/:id(.:format)               comments#destroy
                         #      reviews GET    /reviews(.:format)                    reviews#index
                         #              POST   /reviews(.:format)                    reviews#create
                         #   new_review GET    /reviews/new(.:format)                reviews#new
                         #  edit_review GET    /reviews/:id/edit(.:format)           reviews#edit
                         #       review GET    /reviews/:id(.:format)                reviews#show
                         #              PATCH  /reviews/:id(.:format)                reviews#update
                         #              PUT    /reviews/:id(.:format)                reviews#update
                         #              DELETE /reviews/:id(.:format)                reviews#destroy
                         #       events GET    /events(.:format)                     events#index
                         #              POST   /events(.:format)                     events#create
                         #    new_event GET    /events/new(.:format)                 events#new
                         #   edit_event GET    /events/:id/edit(.:format)            events#edit
                         #        event GET    /events/:id(.:format)                 events#show
                         #              PATCH  /events/:id(.:format)                 events#update
                         #              PUT    /events/:id(.:format)                 events#update
                         #              DELETE /events/:id(.:format)                 events#destroy
                         #       movies GET    /movies(.:format)                     movies#index
                         #              POST   /movies(.:format)                     movies#create
                         #    new_movie GET    /movies/new(.:format)                 movies#new
                         #   edit_movie GET    /movies/:id/edit(.:format)            movies#edit
                         #        movie GET    /movies/:id(.:format)                 movies#show
                         #              PATCH  /movies/:id(.:format)                 movies#update
                         #              PUT    /movies/:id(.:format)                 movies#update
                         #              DELETE /movies/:id(.:format)                 movies#destroy
                         #***        users GET    /users(.:format)                      users#index
                         #              POST   /users(.:format)                      users#create
                         #     new_user GET    /users/new(.:format)                  users#new
                         #    edit_user GET    /users/:id/edit(.:format)             users#edit
                         #         user GET    /users/:id(.:format)                  users#show
                         #              PATCH  /users/:id(.:format)                  users#update
                         #              PUT    /users/:id(.:format)                  users#update
                         #              DELETE /users/:id(.:format)                  users#destroy
