# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Old-style reference data
# Duration units: days
# ExpirationDate.create([
#                      {name: 'Fresh Beef', is_cooked: false, in_fridge: true, duration: 2},
#                      {name: 'Fresh Beef', is_cooked: false, in_freezer: true, duration: 8.months / 1.day},
#                      {name: 'Ground Beef', is_cooked: false, in_fridge: true, duration: 2},
#                      {name: 'Ground Beef', is_cooked: false, in_freezer: true, duration: 8.months / 1.day},
#                      {name: 'Corned Beef', is_cooked: false, in_fridge: true, duration: 2.weeks / 1.day},
#                      {name: 'Corned Beef', is_cooked: false, in_freezer: true, duration: 8.months / 1.day},
#                      {name: 'Steak', is_cooked: false, in_fridge: true, duration: 2},
#                      {name: 'Steak', is_cooked: false, in_freezer: true, duration: 8.months / 1.day},
#
#                      {name: 'Beef', is_cooked: true, in_fridge: true, duration: 7},
#                      {name: 'Beef', is_cooked: true, in_freezer: true, duration: 8.months / 1.day},
#                      {name: 'Steak', is_cooked: true, in_fridge: true, duration: 7},
#                      {name: 'Steak', is_cooked: true, in_freezer: true, duration: 8.months / 1.day},
#                      {name: 'Ground Beef', is_cooked: true, in_fridge: true, duration: 7},
#                      {name: 'Ground Beef', is_cooked: true, in_freezer: true, duration: 8.months / 1.day},
#                      {name: 'Canned Beef', is_cooked: true, is_opened: true, in_fridge: true, duration: 10},
#                      {name: 'Corned Beef', is_cooked: true, in_fridge: true, duration: 10},
#
#                      {name: 'Butter', is_opened: false, in_fridge: true, duration: 1.month / 1.day},
#                      {name: 'Butter', is_opened: false, in_freezer: true, duration: 9.months / 1.day},
#                  ])
#
# 20.times do |n|
#   email = "example-#{n+1}@foodies.net" 
#   password = "password"
#   User.create!(email: email,
#     password: password,
#     password_confirmation: password)
# end
#
# User.all.each do |user|
#   (rand(8) + 1).times do
#     user.ingredients.create!(name: Faker::Lorem.words(3).join(' ').to_s,
#                            purchase_date: Faker::Time.between(2.months.ago, Time.now, :all),
#                            expiration_date_id: rand(ExpirationDate.all.count))
#   end
# end

FoodType.create(name: 'Breads, pastries and cakes')
FoodType.create(name: 'Dairy products')
FoodType.create(name: 'Fruits')
FoodType.create(name: 'Meats')
FoodType.create(name: 'Poultry')
FoodType.create(name: 'Wild game')
FoodType.create(name: 'Seafood')
FoodType.create(name: 'Vegetables')
FoodType.create(name: 'Miscellaneous perishables')
FoodType.create(name: 'Eggs and egg products')

reference_data_file = File.join(Rails.root, 'db', 'reference_data.yml')
config = YAML::load_file(reference_data_file)

# TODO: rewrite
# A duration of -1 means "not recommended or see comments".
config.each do |r|
  name = r['name']

  if r['fridge_duration'] != ''
    fridge = eval("#{r['fridge_duration']}.seconds")
  else
    fridge = nil
  end

  if r['freezer_duration'] != ''
    freezer = eval("#{r['freezer_duration']}.seconds")
  else
    freezer = nil
  end

  comments = r['comments']
  food_type = r['food_type_id']
  ExpirationDate.create(name: name, fridge_duration: fridge, freezer_duration: freezer, comments: comments, food_type_id: food_type)
end

