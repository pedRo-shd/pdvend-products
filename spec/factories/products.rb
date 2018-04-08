FactoryBot.define do
  factory :product do
    name FFaker::Product.product
    description FFaker::Lorem.paragraph
    height { rand(2..50).to_f }
    weight { rand(0..10).to_f }
    width { rand(16..50).to_f }
    length { rand(16..50).to_f }
  end
end
