class ApplicationController < ActionController::API
  before_action :authorized

  MY_SECRET = Rails.application.secrets.secret_key_base.to_s
  
  def encode_token(payload)
    JWT.encode(payload, MY_SECRET)
  end

  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end
  
  def decoded_token(token)
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, MY_SECRET, true, algorithm: 'HS256')[0]
      rescue JWT::DecodeError
        nil
      end
    end
  end

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
    render json: { messsage: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
