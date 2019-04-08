# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create a user
User.create(
  name: 'admin',
  username: 'admin', 
  email: 'admin@test.com',
  password: '12345678',
  password_confirmation: '12345678'
  )

pizzas = [
  { name: 'Margherita', toppings: %W[Tomato\ sauce mozzarella oregano] },
  { name: 'Marinara', toppings: %W[Tomato\ sauce garlic basil]},
  { name: 'Quattro Stagioni', toppings: %W[Tomato\ sauce mozzarella mushrooms ham artichokes olives oregano]},
  { name: 'Carbonara', toppings: %W[Tomato\ sauce mozzarella parmesan eggs bacon]},
  { name: 'Frutti di Mare', toppings: %W[Tomato\ sauce seafood]},
  { name: 'Quattro Formaggi', toppings: %W[Tomato\ sauce mozzarella parmesan, cheese artichokes oregano]},
  { name: 'Crudo', toppings: %W[Tomato\ sauce mozzarella Parma ham]},
  { name: 'Napoletana', toppings: %W[Tomato\ sauce mozzarella oregano anchovies]},
  { name: 'Pugliese', toppings: %W[Tomato\ sauce mozzarella oregano onions]},
  { name: 'Montanara', toppings: %W[Tomato\ sauce mozzarella mushrooms pepperoni Stracchino]},
  { name: 'Emiliana', toppings: %W[Tomato\ sauce mozzarella eggplant boiled potatoes sausage]},
  { name: 'Romana', toppings: %W[Tomato\ sauce mozzarella anchovies capers oregano]},
  { name: 'Fattoria', toppings: %W[Tomato\ sauce mozzarella peppers peas porchetta]},
  { name: 'Schiacciata', toppings: %W[Olive rosemary]},
  { name: 'Prosciutto', toppings: %W[Tomato\ sauce mozzarella ham oregano]},
  { name: 'Americana', toppings: %W[Tomato\ sauce mozzarella sausage french fries]},
  { name: 'Prosciutto e Funghi', toppings: %W[Tomato\ sauce mozzarella ham mushrooms]},
  { name: 'Braccio di Ferro', toppings: %W[Mozzarella spinach, ricotta\ cheese parmesan]},
  { name: 'Sarda', toppings: %W[Tomato\ sauce mozzarella pecorino cheese spicy salami]},
  { name: 'Tonno', toppings: %W[Tomato\ sauce mozzarella tuna, onions]},
  { name: 'Valtellina', toppings: %W[Tomato\ sauce mozzarella bresaola Parmesan flakes rocket]},
  { name: 'Gorgonzola', toppings: %W[Tomato\ sauce mozzarella olives]},
  { name: 'Calzone', toppings: %W[Tomato\ sauce mozzarella ham, mushrooms artichokes, anchovies oregano]},
  { name: 'Pizza al Pesto', toppings: %W[Tomato\ sauce mozzarella Genoese pesto pine nuts olives]},
  { name: 'Mediterranea', toppings: %W[Tomato\ sauce buffalo mozzarella cherry tomatoes pepper]},
  { name: 'Ortolana', toppings: %W[Tomato\ sauce mozzarella assorted vegetables]},
  { name: 'Diavola', toppings: %W[Tomato\ sauce mozzarella spicy salami, chilli pepper]},
  { name: 'Rustica', toppings: %W[Tomato\ sauce mozzarella cheese, eggplants]},
  { name: 'Contadina', toppings: %W[Tomato\ sauce mozzarella asparagus, mushrooms bacon parmesan]},
  { name: 'Parmigiana', toppings: %W[Tomato\ sauce mozzarella eggplants parmesan]},
  { name: 'Capricciosa', toppings: %W[Tomato\ sauce mozzarella ham, artichokes, mushrooms olives]},
  { name: 'Ricotta e Spinaci', toppings: %W[Tomato\ sauce mozzarella ricotta\ cheese spinach]},
  { name: 'Mare e Monti', toppings: %W[Mozzarellatomato\ sauce seafood mushrooms]},
  { name: 'Padana', toppings: %W[Tomato\ sauce parmesan cheese salami zucchini polenta]},
  { name: 'Tedesca', toppings: %W[Tomato\ sauce mozzarella Vienna Sausage]},
  { name: 'Tirolese', toppings: %W[Tomato\ sauce mozzarella cheese speck]},
  { name: 'Boscaiola', toppings: %W[Tomato\ sauce mozzarella mushrooms bacon]},
  { name: 'Campagnola', toppings: %W[Tomato\ sauce mozzarella sausage]},
  { name: 'Vegetariana', toppings: %W[Tomato\ sauce mozzarella]},
  { name: 'Bufalina', toppings: %W[Tomato\ sauce Buffalo mozzarella oregano]},
  { name: 'Fontana', toppings: %W[Tomato\ sauce mozzarella cheese radicchio parmesan]},
  { name: 'Francescana', toppings: %W[Tomato\ sauce mozzarella mushrooms ham parmesan]},
  { name: 'Pizza tartufata',toppings: %W[Mozzarella truffle mushrooms]},
  { name: 'Tricolore', toppings: %W[Mozzarella bresaola parmesan]},
  { name: 'Valdostana', toppings: %W[Tomato\ sauce mozzarella fontina cheese bacon]},
  { name: 'Caprese', toppings: %W[Mozzarella tomato]},
  { name: 'Fiori di zucca', toppings: %W[Mozzarella anchovies olive]},
  { name: 'Bismarck', toppings: %W[Tomato\ sauce mozzarella ham fried egg]},
  { name: 'Funghi', toppings: %W[Tomato\ sauce mozzarella mushrooms parsley olive]},
  { name: 'Mimosa', toppings:%W[Mozzarella cream ham corn]}
]

# populate Pizza, Topping and PizzaTopping models
pizzas.each do |pizza|
  price = rand(5.25...15.99).round(2)
  p = Pizza.find_or_create_by(name: pizza[:name].capitalize, price: price)

  pizza[:toppings].each do |topping|
    pt = Topping.find_or_create_by(name: topping.capitalize)
    PizzaTopping.create(pizza: p, topping: pt)
  end
end

# order

#