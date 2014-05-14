class SessionsController < ApplicationController
  def new
    @title = "Login"
  end
    
  def create
    member = Member.find_by_email(params[:sessions][:email])
    if member && member.authenticate(params[:sessions][:password])
      session[:member] = member
      redirect_to member      
    else
      flash.now[:error] = "Invaild email/password combination." 
      @title = "Login"
      render "new"
    end
  end
  
  def destroy
    flash.now[:notice] = "You are logged out."
    session[:member] = nil
    @title = "Login"
    render "new"
  end
end
