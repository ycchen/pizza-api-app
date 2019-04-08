class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user, :total
  belongs_to :user
  has_many :pizzas

end
