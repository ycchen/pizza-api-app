class PizzaSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  has_many :toppings
  # , serializer: ToppingSerializer
end
