class SessionsController < ApplicationController
   # render layout: "application"

    def home
    end

    def new
        @user = User.new
    end
    
    def create
        user = User.find_by(name: params[:user][:name])
        @user = user.try(:authenticate, params[:user][:password])
        return redirect_to signin_path unless !@user.nil?
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        binding.pry
        session.delete :user_id
        redirect_to signin_path
    end


end