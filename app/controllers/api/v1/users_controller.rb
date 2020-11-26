class Api::V1::UsersController < ApplicationController
    skip_before_action  :authorized, only: [:create]
    # skip_before_action :authorized

    def index
        users = User.all 

        
        render json: users
    end

    def show
        user = User.find(params[:id])

        render json: user
    end

    def profile
        render json: { user: current_user }, statu: :accepted
    end

    def create
        @user = User.create(user_params)
        # byebug
        if @user.valid?
          @token = encode_token(user_id: @user.id)
        #   render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        render json: { user: @user, jwt: @token }, status: :created
        else
          render json: { message: @user.errors.full_messages }, status: :not_acceptable
        end
      end

      def mySamples
       
        # byebug
      end

    # def create
    #     user = User.create(user_params) 
    #     if user.valid?
    #         payload = {user_id: user.id}
    #         token = encode_token(payload)
    #         # puts token
    #         # byebug
    #         # render json: {user: user, jwt: token}
    #         render json: { user: UserSerializer.new(user), jwt: token }, status: :created
    #     else
    #         render json: {errors: user.errors.full_messages}, status: :not_acceptable
    #     end
    #   end


    private

    def user_params
        params.require(:user).permit!
    end
    
end
