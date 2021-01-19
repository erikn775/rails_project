class Car < ApplicationRecord
    has_many :posts
    belongs_to :user
    validates :year, :make, :model, :color, :transmission, :body_style, :engine, :mileage, presence: true

    def find_car
        Car.find_by(id: params[:id])
    end
end
