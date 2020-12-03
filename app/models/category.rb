class Category < ApplicationRecord
    has_many :products, class_name: "product", foreign_key: "reference_id"
end
