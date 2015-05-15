# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#user1 = User.create(name: 'Arnold', password: 'azerty', mail: 'arnold@nodomain.com', lang: 'fr', country: 'fr', categories: [ 'movies', 'music' ])
user1 = User.create(name: 'Arnold', lang: 'fr', country: 'fr', categories: [ 'movies', 'music' ])
top1 = Top.create(title: 'Les meilleurs films en 2015', tags: ['#avengers2, #cinema, #science-fiction', '#divergente2'], category: 'movies', user: user1)
Item.create(title: 'Avengers 2', top: top1)
Item.create(title: 'Divergente 2', top: top1)
