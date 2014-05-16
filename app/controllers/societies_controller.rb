class SocietiesController < ApplicationController
  before_action :set_society, only: [:show, :edit, :update, :destroy]

  # GET /societies
  # GET /societies.json
  def index
    @societies = Society.all
  end

  # GET /societies/1
  # GET /societies/1.json
  def show
  end

  # GET /societies/new
  def new
    if logged_in?
      @society = Society.new
      @society.members.build.joins.build.role = "President"
      @society.members.build.joins.build.role = "Treasurer"
    else
      redirect_to login_path
    end    
  end

  # GET /societies/1/edit
  def edit
    if !manager?(current_member)
      flash.now[:error] = "Only admin of society can edit details about society."
      render "show"
    end
  end

  # POST /societies
  # POST /societies.json
  def create
    @society = Society.new(society_params)
    puts society_params
    respond_to do |format|
      if @society.save
        flash[:notice] = "Society was successfully created."
        session[:society] = @society
        format.html { redirect_to @society }
        format.json { render action: 'show', status: :created, location: @society }
      else
        format.html { render action: 'new' }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end    
  end

  # PATCH/PUT /societies/1
  # PATCH/PUT /societies/1.json
  def update
    respond_to do |format|
      if @society.update(society_params)
        flash[:notice] = "Society was successfully updated."
        format.html { redirect_to @society }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @society.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /societies/1
  # DELETE /societies/1.json
  def destroy
    @society.destroy
    respond_to do |format|
      format.html { redirect_to societies_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_society
      @society = Society.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def society_params
      params.require(:society).permit(:name, :register_num, :website, :description).tap do |whitelisted|
        params_member = Hash.new
        params[:society][:members_attributes].each do |k,v|
          password = (0...8).map { (65 + rand(26)).chr }.join
          v = v.merge(:password => "#{password}", :password_confirmation => "#{password}")
          params_member[k] = v
        end              
        whitelisted[:members_attributes] = params_member
      end        
    end
end
