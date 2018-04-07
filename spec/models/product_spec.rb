require 'rails_helper'

RSpec.describe Product, type: :model do

  it "is not valid without a name, must have a specific message error" do
    product = Product.new(name: nil)
    expect(product).to_not be_valid
    expect(product.errors[:name]).to include("can't be blank")
  end
  
  it "is not valid without a height, must have a specific message error" do
    product = Product.new(height: nil)
    expect(product).to_not be_valid
    expect(product.errors[:height]).to include("can't be blank")
  end

  it "is not valid without a weight, must have a specific message error" do
    product = Product.new(weight: nil)
    expect(product).to_not be_valid
    expect(product.errors[:weight]).to include("can't be blank")
  end

  it "is not valid without a width, must have a specific message error" do
    product = Product.new(width: nil)
    expect(product).to_not be_valid
    expect(product.errors[:width]).to include("can't be blank")
  end

  it "must be valid with values of attributes presence" do
    product = Product.new(name: FFaker::Product.product,
                          height: rand(0..1000).to_f,
                          weight: rand(0..1000).to_f,
                          width: rand(0..1000).to_f,
                          length: rand(0..1000).to_f)
    expect(product).to be_valid
  end

  it "must be valid without values of attributes presence" do
    product = Product.new(name: nil,
                          height: rand(0..1000).to_f,
                          weight: rand(0..1000).to_f,
                          width: rand(0..1000).to_f,
                          length: rand(0..1000).to_f)
    expect(product).not_to be_valid
    expect(product.errors[:name]).to include("can't be blank")
  end
end
