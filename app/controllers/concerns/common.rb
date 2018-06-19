module Common
  extend ActiveSupport::Concern

  protected

  def authenticate_request!
    render_unauthorized unless current_user
  end

  def authorization_admin!
    render_forbidden unless current_user.role_admin?
  end

  def render_unauthorized
    render json: { error: "Unauthorized" }, status: 401
  end

  def render_forbidden
    render json: { error: "Forbidden" }, status: 403
  end

  def render_not_found
    render json: { error: "Not found" }, status: 404
  end

  def authenticate_user(email, password)
    user = User.find_by(email: email)

    unless user.nil?
      if user.valid_password?(password)
        render json: user_payload(user)
      else
        render_unauthorized
      end
    else
      render_unauthorized
    end
  end

  def current_user
    @current_user ||= User.find_by(authentication_token: jwt_token[:authentication_token])
  rescue
    nil
  end

  def http_token
    puts request.headers['Authorization']
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def jwt_token
    @jwt_token ||= jwt_decode(http_token)
  end

  def jwt_encode(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base)
  end

  def jwt_decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.credentials.secret_key_base)[0])
  rescue
    nil
  end

  def user_payload(user)
    { user: UserSerializer.new(user), token: jwt_encode({ authentication_token: user.authentication_token }) }
  end
end
