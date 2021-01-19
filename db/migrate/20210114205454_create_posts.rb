class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :image_url
      t.string :title
      t.string :content
      t.belongs_to :user
      t.belongs_to :car
      t.timestamps
    end
  end
end
