#este controlador mantiene la logica de usuarios customer
class UsersController < ApplicationController
	#skip_before_action :require_login, only: [:new, :create]
	def new
		flash[:notice] = "crear usuario"
		@user = Shoppe::User.new
	end

	def create
		@user = Shoppe::User.new(user_params)
		if @user.save
			login(params[:user][:email], params[:user][:password])
			flash[:success] = 'Tu cuenta ha sido creada. Bienvenido Pirata!'
			redirect_back_or_to beers_path
		else
			render 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
	end
end
