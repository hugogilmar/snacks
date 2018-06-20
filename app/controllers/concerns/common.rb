module Common
  extend ActiveSupport::Concern

  protected

  def authenticate_request!
    render_unauthorized unless current_user
  end

  def authorization_admin!
    render_forbidden unless current_user.role_admin?
  end

  def authorization_customer!
    render_forbidden unless current_user.role_customer?
  end

  def render_unauthorized
    render json: { error: "Unauthorized" }, status: 401 and return
  end

  def render_forbidden
    render json: { error: "Forbidden" }, status: 403 and return
  end

  def render_not_found
    render json: { error: "Not found" }, status: 404 and return
  end

  def render_unprocessable_entity(errors)
    render json: { errors: errors }, status: 422 and return
  end

  def render_no_content
    render nothing: true, status: 204 and return
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
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def jwt_token
    @jwt_token ||= HashWithIndifferentAccess.new(jwt_decode(http_token).first)
  end

  def jwt_encode(payload)
    JWT.encode(payload, Rails.application.credentials.secret_key_base, 'HS256')
  end

  def jwt_decode(token)
    begin
      return JWT.decode(token, Rails.application.credentials.secret_key_base, true, { algorithm: 'HS256' })
    rescue
      nil
    end
  end

  def user_payload(user)
    expires_at = Time.now.to_i + 60 * 60
    issued_at = Time.now.to_i

    { token: jwt_encode({ exp: expires_at, iat: issued_at, authentication_token: user.authentication_token }) }
  end
end
