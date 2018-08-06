# State-Restoring-Quiz-Game

“State-restoring” means that a person should be able to pause the game at any given
moment of time and continue from the point he/she left the game. Even when the app is
closed and opened again the person should have an option of continuing the quiz or
start a new quiz.

## Features
- Registration and Login for Users.
- Login for Admins.
- Multiple​ ​genres​ ​of​ ​quizzes​ ​are available.
- Leaderboard​ ​for​ ​the​ ​users​ in each genre.
- The admin​ has a separate page with access to all the questions and leaderboard data. Also the data of users.
- The users​ have an option of viewing which quizzes they have attempted/not-attempted and the respective scores in each quiz.

## Instructions
**Note:- Ruby on Rails should be installed**
- Change into the main directory.
- Firstly install all the dependecies for the app by running:

> $ bundle install

- Initialise the database of the app by running:

> $ rails db:create

- Fill the database with the admin credentials and the dummy users by running:

> $ rails db:migrate:reset
> $ rails db:seed

- Lastly run the servver by running:

> $ rails server

- Then open the url "http://localhost:3000/" on your web browser to access the quiz.

**Note: The admin email is "anirudh@gmail.com" and the password is "foobar". The dummy emails are in the form of "example-[i]@railstutorial.org" where i varies from 1 to 100 and their password is "password".**
