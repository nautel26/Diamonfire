class Category < ActiveRecord::Base
  include Attachable

  has_many :products, dependent: :destroy
end
