class UsersController < ApplicationController
    before_action :authenticate, only: [:index]

    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(params_user)
        if @user.save
            redirect_to root_path
        else
            redirect_to 'user/new', alert: 'Não foi possível criar o usuário'
        end
    end

    private
        def params_user
            params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end
end
  