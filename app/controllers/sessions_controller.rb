class SessionsController < ApplicationController
  def new
    @title = "Login"
  end
    
  def create
    @member = Member.authenticate(params[:sessions][:email], 
                                  params[:sessions][:password])
    if @member.nil?
      flash.now[:error] = "Invaild email/password combination." 
      @title = "Login"
      render "new"
    else
      session[:member] = @member
      redirect_to @member
    end
  end
  
  def destroy
    flash.now[:notice] = "You are logged out."
    session[:member] = nil
    @title = "Login"
    render "new"
  end
end
