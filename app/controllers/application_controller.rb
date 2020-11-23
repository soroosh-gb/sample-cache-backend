class ApplicationController < ActionController::API
    before_action :authorized
   

    def encode_token(payload)
        JWT.encode(payload, 'my_s3cr3t')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        # byebug
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    # def current_user
    #     if decoded_token
    #         user_id = decoded_toke[0] ['user_id']
    #         @user = User.find_by(id: user_id)

    #         # @user = User.find_by(id: session[:user_id])

    #         # @_current_user ||= session[:current_user_id] &&
    #         # User.find_by(id: session[:current_user_id])
    #     end
    # end

    def current_user
        if decoded_token
          user_id = decoded_token[0]['user_id']
          @user = User.find_by(id: user_id)
        end
      end
    
      def logged_in?
        !!current_user
      end
    
      def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
      end
end


#     def session_user
#         decoded_hash = decoded_token
#         if !decoded_hash.empty? 
#             puts decoded_hash.class
#             user_id = decoded_hash[0]['user_id']
#             @user = User.find_by(id: user_id)
#         else
#             nil 
#         end
#     end

#     # def logged_in?
#     #     !!current_user 
#     # end

#     def logged_in?
#         !!session_user
#     end

#     def authorized
#         render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
#     end
# end
