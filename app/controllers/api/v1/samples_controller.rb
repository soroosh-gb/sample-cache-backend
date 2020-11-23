class Api::V1::SamplesController < ApplicationController
    skip_before_action :authorized
    # before_action :authorized

    def index
        samples = Sample.all 
        # byebug
        render json: samples
    end

    def show
        sample  = Sample.find(params[:id])

        render json: sample
    end

    # def create 
    #     sample = Sample.create(sample_params)

    #     render json: sample
    # end

    def create
        # byebug
        image_file = Cloudinary::Uploader.upload(params[:image_file])
        audio_file = Cloudinary::Uploader.upload(params[:audio_file], :resource_type => :video)
        sample = Sample.create(image_file: image_file["url"], audio_file: audio_file["url"], name: params[:name], genre: params[:genre], collection: params[:collection], creator: current_user)

        render json: sample
    end


    def destroy
        sample  = Sample.find(params[:id])

        sample.destroy
    end


    private

    def sample_params
        params.require(:sample).permit!
    end

    
end
