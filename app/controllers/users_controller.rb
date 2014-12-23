class UsersController < ApplicationController
	before_action :correct_user,   only: [:edit, :update,:show]  
	def show
    
		@user = User.find(params[:id])
	end

  	def new
  		@user = User.new
  	end

  	def create
      @user =User.new(user_params)
      if @user.save
        flash[:success] = "Dang ky thanh cong !"
        
        redirect_to :action =>'home', :controller => "homes" 
      else
        render 'new'
      end
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
  	

    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation, :avatar, :phone ,:address )
    end
     def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    
end
