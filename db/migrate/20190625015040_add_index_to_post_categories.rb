class AddIndexToPostCategories < ActiveRecord::Migration[5.2]
  def change
    add_index :post_categories, [:post_id, :category_id], unique: true
  end
end
