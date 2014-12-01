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

