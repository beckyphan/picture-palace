Rails.application.routes.draw do
  get 'sessions/login'
  post 'sessions/login'
  delete 'sessions/logout'
  root 'movies#landing'

  resources :events do
    resources :comments
  end

  resources :movies do
    resources :reviews
  end

  resources :users, only: [:create, :new, :edit, :show, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                              movies#landing
#                        sessions_login GET    /sessions/login(.:format)                                      sessions#login
#                                       POST   /sessions/login(.:format)                                      sessions#login
#                       sessions_logout DELETE /sessions/logout(.:format)                                     sessions#logout
# #                        event_comments GET    /events/:event_id/comments(.:format)                         comments#index
#                                       POST   /events/:event_id/comments(.:format)                           comments#create
#                     new_event_comment GET    /events/:event_id/comments/new(.:format)                       comments#new
#                    edit_event_comment GET    /events/:event_id/comments/:id/edit(.:format)                  comments#edit
#                         event_comment GET    /events/:event_id/comments/:id(.:format)                       comments#show
#                                       PATCH  /events/:event_id/comments/:id(.:format)                       comments#update
#                                       PUT    /events/:event_id/comments/:id(.:format)                       comments#update
#                                       DELETE /events/:event_id/comments/:id(.:format)                       comments#destroy

#                                events GET    /events(.:format)                                              events#index
#                                       POST   /events(.:format)                                              events#create
#                             new_event GET    /events/new(.:format)                                          events#new
#                            edit_event GET    /events/:id/edit(.:format)                                     events#edit
#                                 event GET    /events/:id(.:format)                                          events#show
#                                       PATCH  /events/:id(.:format)                                          events#update
#                                       PUT    /events/:id(.:format)                                          events#update
#                                       DELETE /events/:id(.:format)                                          events#destroy

#                         movie_reviews GET    /movies/:movie_id/reviews(.:format)                            reviews#index
#                                       POST   /movies/:movie_id/reviews(.:format)                            reviews#create
#                      new_movie_review GET    /movies/:movie_id/reviews/new(.:format)                        reviews#new
#                     edit_movie_review GET    /movies/:movie_id/reviews/:id/edit(.:format)                   reviews#edit
#                          movie_review GET    /movies/:movie_id/reviews/:id(.:format)                        reviews#show
#                                       PATCH  /movies/:movie_id/reviews/:id(.:format)                        reviews#update
#                                       PUT    /movies/:movie_id/reviews/:id(.:format)                        reviews#update
#                                       DELETE /movies/:movie_id/reviews/:id(.:format)                        reviews#destroy

#                                movies GET    /movies(.:format)                                              movies#index
#                                       POST   /movies(.:format)                                              movies#create
#                             new_movie GET    /movies/new(.:format)                                          movies#new
#                            edit_movie GET    /movies/:id/edit(.:format)                                     movies#edit
#                                 movie GET    /movies/:id(.:format)                                          movies#show
#                                       PATCH  /movies/:id(.:format)                                          movies#update
#                                       PUT    /movies/:id(.:format)                                          movies#update
#                                       DELETE /movies/:id(.:format)                                          movies#destroy

#                                 users POST   /users(.:format)                                               users#create
#                              new_user GET    /users/new(.:format)                                           users#new
#                             edit_user GET    /users/:id/edit(.:format)                                      users#edit
#                                  user GET    /users/:id(.:format)                                           users#show
#                                       PATCH  /users/:id(.:format)                                           users#update
#                                       PUT    /users/:id(.:format)                                           users#update
#                                       DELETE /users/:id(.:format)                                           users#destroy
