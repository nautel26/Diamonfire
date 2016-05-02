class Product < ActiveRecord::Base
  include Attachable

  belongs_to :product_category
  has_many :reviews, dependent: :destroy
end
