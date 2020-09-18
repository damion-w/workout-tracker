# Inherit from APiController so that we have access to its methods
class SessionsController < ApiController
    
    # Don't do any of this if when a user is registering
    before_action :require_login, except: [:create]

    # If the user enters the correct creds, give them a token.  Else, send an error.
    def create
        if user = User.validate_login(params[:username], params[:password])
            allow_token_to_be_used_only_once_for(user)
            send_token_for_valid_login_of(user)
        else
            render_unauthorized("error with your login or password")
        end
    end

    # Called when user logs out
    def destroy
        logout
        head :ok
    end

    private

    # Generates an auth token
    def allow_token_to_be_used_only_once_for(user)
        user.regenerate_auth_token
    end

    # Sends auth token to client
    def send_token_for_valid_login_of(user)
        render json: { token: user.auth_token }
    end

    # Sets auth_token to nil
    def logout
        current_user.invalidate_token
    end
end
