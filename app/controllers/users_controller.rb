class UsersController < ApplicationController

    before_action :authentication_required, only: [:show]

    def new
        @user = User.new
    end

    def show
        #binding.pry
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)

        if @user.save 
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end

    end

    def destroy
    end

    private
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end

  end