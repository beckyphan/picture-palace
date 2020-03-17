# Picture Palace

picture palace. n. (Film) Brit an old-fashioned name for cinema
this rails application creates a social network for movie-goers to share movie reviews and create events around movie watching.

## Usage

This application is best utilized with more than one user. Each user is able to add movies and create events. Users can also write reviews for movies.

Events can be created by any user revolving a particular movie, and other users may attend the event. If a user is attending the event, they may write comments on the event page.

A user's home page will contain a list of movies they have reviewed, as well as events they are hosting and attending.

## Getting Started

You can clone a copy of this repository to your local computer.

### Prerequisites

You should have your own Google Client ID and Google Client Secret to use for this application if you wish to utilize the Oauth2 sign-up/log-in process.
Otherwise, be sure to comment out the code for those log-in in the Login and Sign-up views.

This project utilizes PostGresql as its database.

### Installing

After cloning, make sure to run ```bundle install``` to install all the necessary gems
Create your database with ```rake db:create ``` and run the migrations ```rake db:migrate```
If you wish to have some seed movies to work with, run ```rake db:seed```

Important: To ensure Oauth2 sign-up/log-in with Google is working properly, please ensure you create a ```.env``` file at the root of your project directory AND create a ```'DEFAULT_PASSWORD'``` for users logging in via Oauth2.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

This is a rails portfolio project for the Flatiron School.
