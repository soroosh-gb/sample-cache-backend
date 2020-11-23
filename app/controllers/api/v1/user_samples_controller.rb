class Api::V1::UserSamplesController < ApplicationController

    def index 
    
    end

    def new
        userSample = UserSample.new
    end

    def create
        userSample = UserSample.create(params.require(:userSample).permit(:sample_id, :user_id))
    end
    
    def destroy
        userSample = UserSample.find(params[:id])
        user = userSample.user
        userSample.destroy
    end
end
