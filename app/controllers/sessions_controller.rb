class SessionsController < ApplicationController
  def new
    @title = "Login"
  end
    
  def create
    member = Member.find_by_email(params[:sessions][:email])
    if member && member.authenticate(params[:sessions][:password])
      session[:member_id] = member.id
      redirect_to member
    else 
      gflash :now, error: "Invaild email/password combination." 
      @title = "Login"
      render "new"
    end
  end
  
  def destroy
    gflash :now, notice: "You are logged out."
    session[:member_id] = nil
    @title = "Login"
    render "new"
  end
end
