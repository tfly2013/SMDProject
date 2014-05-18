class SocietiesController < ApplicationController
  before_action :set_society, only: [:join, :show, :edit, :update, :destroy]

  # GET /societies/1/join
  def join
    Join.create(member_id: current_member.id, 
        society_id: @society.id, role: "Member", admin: false)
    flash.now[:notice] = "You have joined this society successfully!"
    render "show"
  end  
    
  def autocomplete
    societies = Society.all.order(:name)
    respond_to do |format|
      format.html
      format.json { 
        render json: societies.map(&:name)
      }
    end
  end  
  
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
      representative = @society.joins.build
      representative.role = "Representative"
      representative.member = current_member
      president = @society.joins.build
      president.role = "President"
      president.build_member unless president.member
      treasurer = @society.joins.build
      treasurer.role = "Treasurer"
      treasurer.build_member unless treasurer.member
    else
      redirect_to login_path
    end    
  end

  # GET /societies/1/edit
  def edit
    join = Join.find_by_member_id_and_society_id(current_member.id, @society.id)
    if join.nil? || !join.admin
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
        session[:society_id] = @society.id
        #Join.create(member_id: current_member.id, society_id: @society.id, role:"Representative", admin: true)
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
      params.require(:society).permit(:name, :register_num, :website, :description, :logo).tap do |whitelisted|
        whitelisted[:joins_attributes] = joins_attributes
      end        
    end
    
    def joins_attributes
        params_joins = Hash.new
        params[:society][:joins_attributes].each do |key,value|
          params_member = value[:member_attributes]
          if !params_member.nil?
            member = Member.find_by_email(params_member[:email])
            if member.nil?
              password = (0...8).map { (65 + rand(26)).chr }.join                  
              params_member = params_member.merge(:password => "#{password}",
                             :password_confirmation => "#{password}")
              value[:member_attributes] = params_member
            else
              value.delete(:member_attributes)
              value = value.merge(member_id: member.id)
              puts value
            end
          end
          params_joins[key] = value
        end
        return params_joins
    end
end
