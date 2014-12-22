class UsersController < ApplicationController
	
	def show

		@user = User.find(params[:id])
	end

  	def new
  		@user = User.new
  	end

  	def create
      @user =User.create(user_params)
      if @user.blank?
        redirect_to :action =>'home', :controller => "homes"  
      else
        render 'new'
      end

    def edit
      @user = User.find(params[:id]) 
    end
       
    def update 
      @user = User.find(params[:id]) 
      # @user= User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to :action => "show" 
      else
        render 'edit'
      end
    end
  	end

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :avatar)
    end
end
