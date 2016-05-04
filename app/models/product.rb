class Product < ActiveRecord::Base
  include Attachable

  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy

  ATTRIBUTES = [:name, :price, :sku, :description, :category_id]

  validates :price, presence: true
end
