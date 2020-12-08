class Cart < ApplicationRecord
    belongs_to :user
    has_many :products
    belongs_to :order, optional: true
end