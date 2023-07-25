# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Group.destroy_all
Post.destroy_all


user1 = User.create!(email: 'user1@example.com', password: 'password', displayname: "Bob Marley", username: "BMarley22", password_confirmation: 'password')
user2 = User.create!(email: 'user2@example.com', password: 'password', displayname: "Paul Anderson", username: "PAndy", password_confirmation: 'password')
keshawn = User.create!(email: 'keshawn@example.com', password: 'password', displayname: "Keshawn Davis", username: "Kdavis02", password_confirmation: 'password')

circle1 = Group.create(name: "Circle 1")
circle2 = Group.create(name: "Circle 2")


circle1.users << user1
circle1.users << user2
circle2.users << user2

circle1.posts.create!(title: "Post 1 in Circle 1", body: "This is the body of post 1 in Circle 1", user: user1)
circle1.posts.create!(title: "Post 2 in Circle 1", body: "This is the body of post 2 in Circle 1", user: user2)
circle2.posts.create!(title: "Post 1 in Circle 2", body: "This is the body of post 1 in Circle 2", user: user2)

