class ApiController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods

    # If the token is present and valid, proceed with login.  If not, return access denied
    def require_login
        authenticate_token || render_unauthorized("Access denied")
    end

    # If there is a user logged in, return it.  Else, search db for user with this token and return that user
    def current_user
        @current_user ||= authenticate_token
    end

    protected

    # Handles returning login error messages
    def render_unauthorized(message)
        errors = { errors: [ detail: message ] }
        render json: errors, status: :unauthorized
    end

    private

    # Handles searching for tokens in user table
    def authenticate_token
        authenticate_with_http_token do | token, options |
            User.find_by(auth_token: token)
        end
    end
end
