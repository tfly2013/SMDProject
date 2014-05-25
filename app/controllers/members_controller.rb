class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy, :change_password, :update_password]
  before_action :require_login, only: [:show, :edit, :update, :destroy, :change_password, :update_password]
  before_action :require_self, only: [:edit, :update, :destroy, :change_password, :update_password]
  
  def require_self
    if current_member != @member
      redirect_to @member
    end
  end
  
  # GET /members/1/change_password
  def change_password
    
  end
  
  # Post /members/1/update_password
  def update_password
    if @member.authenticate(params[:member][:old_password])
      if (params[:member][:password] == params[:member][:password_confirmation])
          @member.password_digest = BCrypt::Password.create(params[:member][:password])
          if @member.save
            redirect_to @member
          else
            gflash :now, error: "Password update failed."
            render 'change_password'
          end
      else
            gflash :now, error: "New password and password confirmation mismatch."
            render 'change_password'
      end
    else
        gflash :now, error: "Invalid old password."
        render 'change_password'
    end
  end
  
  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
    
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(create_params)
    respond_to do |format|
      if @member.save
        session[:member_id] = @member.id
        format.html { redirect_to @member }
        format.json { render action: 'show', status: :created, location: @member }
      else
        format.html { render action: 'new' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(update_params)
        format.html { redirect_to @member }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    session[:member_id] = nil
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end
    
    def create_params
      params.require(:member).permit(:email, :password, :password_confirmation, :name, :student_id, :phone)
    end
    
    def update_params
      params.require(:member).permit(:name, :student_id, :phone)
    end
      
end
