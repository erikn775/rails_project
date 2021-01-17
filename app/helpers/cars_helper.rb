module CarsHelper

    def car_delete_helper(car)
        if logged_in? && current_user.id == car.user_id
            button_to "Delete Car", car_path(car), :method => :delete
        end
    end
end
