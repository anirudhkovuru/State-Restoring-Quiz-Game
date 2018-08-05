# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Anirudh",
             email: "anirudh@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

99.times do |n|
  name  = "example-#{n+1}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

5.times do |n|
  question = "question-#{n+1}"
  opt1 = "1"
  opt2 = "2"
  opt3 = "3"
  opt4 = "4"
  answer = "A"
  genre = "History-India"
  Question.create!(question: question,
                   opt1: opt1,
                   opt2: opt2,
                   opt3: opt3,
                   opt4: opt4,
                   answer: answer,
                   genre: genre)
end

5.times do |n|
  question = "question-#{n+6}"
  opt1 = "1"
  opt2 = "2"
  opt3 = "3"
  opt4 = "4"
  answer = "A"
  genre = "History-Za Warudo"
  Question.create!(question: question,
                   opt1: opt1,
                   opt2: opt2,
                   opt3: opt3,
                   opt4: opt4,
                   answer: answer,
                   genre: genre)
end

5.times do |n|
  question = "question-#{n+11}"
  opt1 = "1"
  opt2 = "2"
  opt3 = "3"
  opt4 = "4"
  answer = "A"
  genre = "Games-Video Games"
  Question.create!(question: question,
                   opt1: opt1,
                   opt2: opt2,
                   opt3: opt3,
                   opt4: opt4,
                   answer: answer,
                   genre: genre)
end

5.times do |n|
  question = "question-#{n+16}"
  opt1 = "1"
  opt2 = "2"
  opt3 = "3"
  opt4 = "4"
  answer = "A"
  genre = "Games-Board Games"
  Question.create!(question: question,
                   opt1: opt1,
                   opt2: opt2,
                   opt3: opt3,
                   opt4: opt4,
                   answer: answer,
                   genre: genre)
end