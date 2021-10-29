class ActivitiesController < ApplicationController
    def create
        @activity = Activity.new(activity_params)

        if @activity.save
            render json: { success: true }, status: :success
        else
            render json: { success: false }, status: :bad_request
    end

    def delete
    end

    def edit
    end

    def getAll
    end

    private

    def activity_params
        params.require(:activity).permit(:name, :description, :date)
    end
end
