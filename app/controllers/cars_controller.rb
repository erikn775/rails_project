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
            flash.now[:alert] = flash_helper(@car)
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
        if @car.update(car_params)
            redirect_to car_path(@car)
        else
            flash.now[:alert] = flash_helper(@car)
            render :edit
        end
    end

    def destroy
        @car = Car.find_by(id: params[:id])
        if current_user.id == @car.user_id
            if @car.destroy
                flash[:message] = "#{@car.model} was successfully deleted"
                redirect_to user_posts_path(@car)
            else
                flash.now[:alert] = "Car was not deleted"
            end 
        end
    end

    private

    def car_params
        params.require(:car).permit(:year, :make, :model, :color, :transmission, :engine, :body_style, :mileage)
    end
end
