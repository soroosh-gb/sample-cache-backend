class Api::V1::UserSamplesController < ApplicationController
    skip_before_action :authorized

    def index 
        # byebug
        userSamples = UserSample.all 

        render json: userSamples
    end

    def new
        userSample = UserSample.new
    end

    def create
        # byebug
        userSample = UserSample.create(user_id: params[:user_id], sample_id: params[:sample_id])
        
        render json: userSample
    end
    
    def destroy
        byebug
        userSample = UserSample.find(params[:id])
        user = userSample.user
        userSample.destroy
    end

    # def userSample_params
    #     params.require(:userSample).permit!
    # end
end
