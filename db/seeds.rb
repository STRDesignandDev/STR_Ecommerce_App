# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.create!(user: User.first, product: Product.first, rating: 1, body: "God I hate this bird. It doesn't even do any tricks.")
Comment.create!(user: User.first, product: Product.first, rating: 3, body: "Ok bird I guess, I'd recommend but not with any enthusiasm. I mean, it is just a bird.")
Comment.create!(user: User.first, product: Product.first, rating: 5, body: "This bird is my only true friend. I'd like to marry this bird.")

Comment.create!(user: User.first, product: Product.second, rating: 1, body: "God I hate this bird. It doesn't even do any tricks.")
Comment.create!(user: User.first, product: Product.second, rating: 3, body: "Ok bird I guess, I'd recommend but not with any enthusiasm. I mean, it is just a bird.")
Comment.create!(user: User.first, product: Product.second, rating: 5, body: "This bird is my only true friend. I'd like to marry this bird.")

Comment.create!(user: User.first, product: Product.last, rating: 1, body: "God I hate this bird. It doesn't even do any tricks.")
Comment.create!(user: User.first, product: Product.last, rating: 3, body: "Ok bird I guess, I'd recommend but not with any enthusiasm. I mean, it is just a bird.")
Comment.create!(user: User.first, product: Product.last, rating: 5, body: "This bird is my only true friend. I'd like to marry this bird.")
