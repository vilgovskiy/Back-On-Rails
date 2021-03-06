#!/usr/bin/ruby
class SessionsController<ApplicationController
	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)

		if user && user.activated && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
			redirect_to root_path
		else
			flash[:danger] = "There was something wrong with your login information"
			# puts flash[:danger]
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end

end
