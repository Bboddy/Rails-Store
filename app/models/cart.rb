class Cart < ApplicationRecord
    belongs_to :user, class_name: "user", foreign_key: "user_id"
    has_many :products, class_name: "product", foreign_key: "reference_id"
end
