class UsersController < ApiController
    
    # Don't do any of this if when a user is registering
    before_action :require_login, except: [:create]

    # Create user with data from the registration form 
    def create
        user = User.create!(user_params)
        render json: { token: user.auth_token }
    end

    # Fetch user
    def profile
        user = User.find_by_auth_token!(request.headers[:token])
        render json: user.profile_info
    end

    private
    
    def user_params
        # Specify that only a user object will be accepted with these keys
        params.require(:user).permit(:username, :email, :password, :first_name, :last_name)
    end

end
