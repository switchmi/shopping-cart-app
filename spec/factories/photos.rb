FactoryBot.define do
  factory :photo do
    association :product, factory: :product
    url "abc.com"
    caption "caption"
  end
end
