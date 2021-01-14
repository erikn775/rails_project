class CarsController < ApplicationController
    include ApplicationHelper
    
    #before_action :require_login

    def index
        @cars = Cars.all
    end

    def new
        @car = Car.new
    end

    def create
        @car = current_user.cars.new(car_params)
        if @car.save
            redirect_to car_path(@car)
        else
            #flash alert or something
            render :new
        end
    end

    def show
        @car = Car.find_by(id: params[:id])
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def car_params
        params.require(:cars).permit(:year, :make, :model, :color, :transmission, :engine, :body_style, :mileage)
    end
end
