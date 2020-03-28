# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "user@email.com")

movie = Movie.create(title: "Movie title", plot: "Movie plot")

season = Season.create(title: "Season title", plot: "Season plot", number: 1)
episode = Episode.create(title: "Episode title", plot: "Episode plot", number: 1, season: season)
