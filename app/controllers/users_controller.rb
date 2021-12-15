class UsersController < ApplicationController

    def new
        if !current_user
        @user = User.new
        else 
            redirect_to welcome_path
        end
    end

    def create 
        @user = User.new(user_params)
        
        if  @user.save
            session[:user_id] = @user.id
            redirect_to welcome_path
        else 
            redirect_to new_user_path
        end
    end

    private
        def user_params
            params.require(:user).permit(:name, :password, :password_confirmation)
        end

end
