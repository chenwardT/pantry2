# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Duration units: days
ExpirationDate.create([
                     {name: 'Fresh Beef', is_cooked: false, in_fridge: true, duration: 2},
                     {name: 'Fresh Beef', is_cooked: false, in_freezer: true, duration: 8.months / 1.day},
                     {name: 'Ground Beef', is_cooked: false, in_fridge: true, duration: 2},
                     {name: 'Ground Beef', is_cooked: false, in_freezer: true, duration: 8.months / 1.day},
                     {name: 'Corned Beef', is_cooked: false, in_fridge: true, duration: 2.weeks / 1.day},
                     {name: 'Corned Beef', is_cooked: false, in_freezer: true, duration: 8.months / 1.day},
                     {name: 'Steak', is_cooked: false, in_fridge: true, duration: 2},
                     {name: 'Steak', is_cooked: false, in_freezer: true, duration: 8.months / 1.day},

                     {name: 'Beef', is_cooked: true, in_fridge: true, duration: 7},
                     {name: 'Beef', is_cooked: true, in_freezer: true, duration: 8.months / 1.day},
                     {name: 'Steak', is_cooked: true, in_fridge: true, duration: 7},
                     {name: 'Steak', is_cooked: true, in_freezer: true, duration: 8.months / 1.day},
                     {name: 'Ground Beef', is_cooked: true, in_fridge: true, duration: 7},
                     {name: 'Ground Beef', is_cooked: true, in_freezer: true, duration: 8.months / 1.day},
                     {name: 'Canned Beef', is_cooked: true, is_opened: true, in_fridge: true, duration: 10},
                     {name: 'Corned Beef', is_cooked: true, in_fridge: true, duration: 10},

                     {name: 'Butter', is_opened: false, in_fridge: true, duration: 1.month / 1.day},
                     {name: 'Butter', is_opened: false, in_freezer: true, duration: 9.months / 1.day},
                 ])