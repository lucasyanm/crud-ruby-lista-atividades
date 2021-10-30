class ActivitiesController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
    end
    
    def create
        @activity = Activity.new(activity_params)

        if @activity.save
            render json: { success: true }, status: :success
        else
            render json: { success: false }, status: :bad_request
        end
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