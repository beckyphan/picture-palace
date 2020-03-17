# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship
      User has_many reviews, User has_many comments, User has_many events
      Movie has_many reviews, Movie has_many events
      Event has_many comments
- [x] Include at least one belongs_to relationship
      Comment belongs_to user, Comment belongs_to event
      Review belongs_to user, Review belongs_to movie
      Event belongs_to user, Event belongs_to movie  
- [x] Include at least two has_many through relationships (x has_many y through z)
      User has_many movies, through reviews (i.e. reviewed movies or watched movies)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z)
      User has_many events, through guestlists; Event has_many users, through guestlists
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
      Review = Join Table between User & Movie, has attributes of description & rating
      Comment - Join Table between User & Event, has attribute of note
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      User is validated for presence of name, username, and email
      User is validated for uniqueness of username & email
      Movie is validated for presence of all fields, as well as uniqueness of movie_title for that year to avoid duplicate entries
      Comments require presence of a note
      Reviews require presences of a title and rating, as well as uniqueness of user within the scope of movie_id to ensure no duplicate reviews
      Guestlists are validated to ensure users cannot click attending for an event that has already happened
      Events are validated for presence of all fields, as well as uniqueness of date_time within scope of user to ensure user is not hosting two separate events at once
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      Class level scope for Event.past with URL: /events/past to show list of previous events
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      Comments are nested within an event; event_comment_path	GET	/events/:event_id/comments/:id(.:format)
      Reviews are nested within a movie; movie_review_path	GET	/movies/:movie_id/reviews/:id(.:format)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
      new_event_comment_path	GET	/events/:event_id/comments/new(.:format)
      new_movie_review_path	GET	/movies/:movie_id/reviews/new(.:format)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
      css to highlight field with errors:
        .field_with_errors input {
          background-color: #ffdddd;
          border: 1px solid #DC143C;
        }'
      error messages for forms are displayed at top of page, within a div for object_errors(instance)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
      Logic limited to display messages for view or determine variable values for view
- [ ] Views use helper methods if appropriate
      View helpers used to display error messages, event date & time in a specific format, and displaying of stars for movie ratings
- [ ] Views use partials if appropriate
      Use of partials for new/edit forms for movie, review, comment, and re-used code for event information
        event_form
        event_listing
        movie_form
        movie_review_form



Future Features to Consider:
- Addition of Search/Filter box for Movies or Events
