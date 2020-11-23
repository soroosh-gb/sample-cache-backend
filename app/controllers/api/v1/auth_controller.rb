class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
  
    def create 
        # byebug
      @user = User.find_by(username: user_login_params[:username])
      if @user && @user.authenticate(user_login_params[:password])
        token = encode_token({ user_id: @user.id })
        render json: { user: @user, jwt: token }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_login_params
      params.require(:user).permit(:username, :password)
    end
  end





# class Api::V1::AuthController < ApplicationController
#     # skip_before_action  :authorized, only: [:create]
#     skip_before_action :authorized, only: [:login, :auto_login]

#     # def create
#     #     # byebug
#     #     @user = User.find_by(username: user_login_params[:username])
#     #     if @user && @user.authenticate(user_login_params[:password])
            
#     #         token = encode_token({ user_id: @user.id })
#     #         render json: { user: UserSerializer.new(@user), jwt:token }, status: :accepted
#     #     else  
#     #         render json: { message: 'Invalid username or password' }, status: :unauthorized
#     #     end
#     # end

#     def login
#         byebug
#         user = User.find_by(username: params[:username])
#         if user && user.authenticate(params[:password_digest])
#             payload = {user_id: user.id}
#             token = encode_token(payload)
#             render json: {user: user, jwt: token, success: "Welcome back, #{user.username}"}
#         else
#             render json: {failure: "Log in failed! Username or password invalid!"}
#         end
#       end
    
#       def auto_login
#         if session_user
#           render json: session_user
#         else
#           render json: {errors: "No User Logged In"}
#         end
#       end
    
#       def user_is_authed
#         render json: {message: "You are authorized"}
#       end

#     private

#     def user_login_params
#         params.require(:user).permit!
#     end

# end
