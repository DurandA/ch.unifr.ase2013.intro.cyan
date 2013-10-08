class SessionsController < ApplicationController

  def new
  end



    def create
      user = User.find_by_login(params[:session][:login])
      if user && user.password==params[:session][:password]
        sign_in user
        redirect_to root_path
      else
        flash.now[:error] = 'Invalid login/password combination'
        render 'new'
      end
    end

  def destroy
    sign_out
    redirect_to root_path
  end



end
