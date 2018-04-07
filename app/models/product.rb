class Product
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :height, type: Float
  field :weight, type: Float
  field :width, type: Float
  field :length, type: Float

  validates :name, :height, :weight, :width, :length, presence: true
end
