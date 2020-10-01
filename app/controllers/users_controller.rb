class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index]
    def index 
        @user = User.find_by(params[:id])
    end

    def show
     @user = User.find_by(params[:id])
    end

    def new 
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end
    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to root
        else
            render 'new'
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render 'edit'
        else
            render 'edit'
        end
    end

    private 
        def user_params
            params.require(:user).permit(:username, :password, :fullname,:is_male, :email, 
                                        :address, :picture, :phone, :position, :infor, :status)
        end
end
