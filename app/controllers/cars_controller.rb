class CarsController < ApplicationController
    include ApplicationHelper
    before_action :require_login

    def index
        if params[:user_id]
            @cars = User.find(params[:user_id]).cars
        else
            @cars = Cars.all
        end
    end

    def new
        @car = Car.new
    end

    def create
        @car = current_user.cars.new(car_params)
        if @car.save
            redirect_to car_path(@car)
        else
            @error = @car.errors.full_messages.join(" - ")
            render :new
        end
    end

    def show
        @car = Car.find_by(id: params[:id])
    end

    def edit
        @car = Car.find_by(id: params[:id])
    end

    def update
        @car = Car.find_by(id: params[:id])
        @car.update(car_params)
        redirect_to car_path(@car)
    end

    def destroy
        @car = Car.find_by(id: params[:id])
        @car.destroy
        redirect_to user_post_index_path(@car)
    end

    private

    def car_params
        params.require(:car).permit(:year, :make, :model, :color, :transmission, :engine, :body_style, :mileage)
    end
end
