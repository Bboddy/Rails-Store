class Category < ApplicationRecord
    has_many :products, class_name: "product", foreign_key: "reference_id", optional: true

    validates :title, presence: true
end
