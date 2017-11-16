FactoryBot.define do
  factory :product do
    association :category, factory: :category
    name "Swiss Army Bag"
    description "Can't leave home without it"
    feature "waterproof"
    price 10
    stock 3
  end
end
