class CreateCategoriesPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :categories_posts, :id => false  do |t|
      t.references :categories
      t.references :posts

      t.timestamps
    end
  end
end
