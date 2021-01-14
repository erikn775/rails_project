class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.belongs_to :user
      t.string :year
      t.string :make
      t.string :model
      t.string :color
      t.string :transmission
      t.string :body_style
      t.string :engine
      t.integer :mileage
      t.timestamps
    end
  end
end
