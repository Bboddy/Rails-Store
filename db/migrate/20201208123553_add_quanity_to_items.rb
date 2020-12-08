class AddQuanityToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :quanity, :integer
  end
end
