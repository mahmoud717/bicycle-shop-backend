class ApplicationController < ActionController::API
  

    def encode_token(payload)
        # here I'm using a dummy secret for test cases, normally I would use my rails env app secret
      JWT.encode(payload, 'secret')
    end
  
    def auth_header
      # { Authorization: 'Bearer <token>' }

      request.headers['Authorization']
    end
  
    def decoded_token
      if auth_header
        token = auth_header.split(' ')[1]
        # header: { 'Authorization': 'Bearer <token>' }
        begin
          JWT.decode(token, 'secret', true, algorithm: 'HS256')
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def logged_in_user
      if decoded_token
        user_id = decoded_token[0]['user_id']
        @user = User.find_by(id: user_id)
      end
    end
  
    def logged_in?
      !!logged_in_user
    end
  
    def authorized
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end 
    def check_logged_in
        logged_in? ? logged_in_user : nil
    end
end
