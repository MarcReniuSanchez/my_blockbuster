# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
User.create(email: "user1@email.com")
User.create(email: "user2@email.com")

# Movies
Movie.create(title: "Movie 1 title", plot: "Movie 1 plot")
Movie.create(title: "Movie 2 title", plot: "Movie 2 plot")
Movie.create(title: "Movie 3 title", plot: "Movie 3 plot")

# Seasons
Season.create(title: "A season 1", plot: "Season plot for 1", number: 1)
Season.create(title: "A season 2", plot: "Season plot for 2", number: 2)
Season.create(title: "Another season", plot: "Season plot for another", number: 1)

# Episodes
Episode.create(title: "Episode 1-2", plot: "Episode plot", number: 2, season: Season.first)
Episode.create(title: "Episode 1-3", plot: "Episode plot", number: 3, season: Season.first)
Episode.create(title: "Episode 2-1", plot: "Episode plot", number: 1, season: Season.second)
Episode.create(title: "Episode 1-1", plot: "Episode plot", number: 1, season: Season.first)
Episode.create(title: "Episode 1-1", plot: "Episode plot", number: 1, season: Season.last)

# Purchase options
PurchaseOption.create(price: 1.4, hd_quality: false, media: Movie.first)
PurchaseOption.create(price: 3.4, hd_quality: true, media: Movie.first)
PurchaseOption.create(price: 1.5, hd_quality: false, media: Movie.second)
PurchaseOption.create(price: 2.0, hd_quality: false, media: Movie.last)

PurchaseOption.create(price: 4.0, hd_quality: true, media: Season.first)
PurchaseOption.create(price: 3.5, hd_quality: true, media: Season.second)
PurchaseOption.create(price: 6.1, hd_quality: true, media: Season.last)

# Purchases
Purchase.create(user: User.first, media_type: Movie.name, media_id: Movie.first.id, purchase_option_id: Movie.first.purchase_options.first.id)
Purchase.create(user: User.first, media_type: Season.name, media_id: Season.first.id, purchase_option_id: Season.first.purchase_options.first.id)
