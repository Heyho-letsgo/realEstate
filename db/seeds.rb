# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all
Product.create!(id: 1, name: "Banana", price: "1.00")
Product.create!(id: 2, name: "Apple", price: "1.50")
Product.create!(id: 3, name: "Grape", price: "0.10")
Product.create!(id: 4, name: "Strawberry", price: "0.30")
Product.create!(id: 5, name: "Blueberry", price: "0.50")
Product.create!(id: 6, name: "Raspberry", price: "0.33")