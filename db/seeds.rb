# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

boards = Board.create([{ name: "Music", category: "Creative" }, { name: "Video Games", category: "Interests" }, { name:
"Papercraft", category: "Creative" }, { name: "Travel", category: "Other"}, { name: "Fitness", category: "Other" }, { name: "Technology", category: "Interests" }])
