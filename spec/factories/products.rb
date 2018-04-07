FactoryBot.define do
  factory :product do
    name FFaker::Product.product
    description FFaker::Lorem.paragraph
    id { rand(0..1000).to_i }
    height { rand(0..1000).to_f }
    weight { rand(0..1000).to_f }
    width { rand(0..1000).to_f }
    length { rand(0..1000).to_f }
  end
end
