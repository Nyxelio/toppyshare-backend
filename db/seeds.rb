# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(name: 'Arnold', lang: 'fr', country: 'fr', categories: [ 'movie', 'music' ], email: 'arnold@nodomain.tld', password: 'azertyui12', password_confirmation: 'azertyui12')
user2 = User.create(name: 'Rosy', lang: 'en', country: 'en', categories: [ 'travel' ], email: 'rosy@nodomain.tld', password: 'rosytyui12', password_confirmation: 'rosytyui12')
top1 = Top.create(title: 'Les meilleurs films en 2015', tags: ['#avengers2, #cinema, #science-fiction', '#divergente2'], category: 'movies', user: user1)
Item.create(title: 'Avengers 2', top: top1)
Item.create(title: 'Divergente 2', top: top1)


top2 = Top.create(title: 'Les meilleurs voyages en 2014', tags: ['#evasion'], category: 'travel', user: user2)
Item.create(title: 'Andorre', top: top2)
Item.create(title: 'Carcassonne', top: top2)
