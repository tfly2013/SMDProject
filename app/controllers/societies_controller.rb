class SocietiesController < ApplicationController
  before_action :set_society, only: [:join, :show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :join, :edit, :update, :destroy]
  
  # GET /societies/1/join
  def join 
    Join.create(member_id: current_member.id, 
        society_id: @society.id, role: "Member", admin: false)
    gflash :now, success: 'You joined this society successfully.'
    render "show"
  end  
    
  def autocomplete
    terms = params[:term].split(", ")
    term = terms.pop
    societies = Society.all.order(:name).where("name LIKE ?", "#{term}%")
    respond_to do |format|
      format.html
      format.json { render json: societies.map(&:name) - terms }
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
      @society = Society.new
      representative = @society.joins.build
      representative.role = "Representative"
      representative.member = current_member
      representative.admin = true
      president = @society.joins.build
      president.role = "President"
      president.admin = true
      president.build_member unless president.member
      treasurer = @society.joins.build
      treasurer.role = "Treasurer"
      treasurer.build_member unless treasurer.member
  end

  # GET /societies/1/edit
  def edit
    join = Join.find_by_member_id_and_society_id(current_member.id, @society.id)
    if join.nil? || !join.admin
      flash :now, :error => "Only admin of society can edit details about society."
      render "show"
    end
  end

  # POST /societies
  # POST /societies.json
  def create
    @society = Society.new(society_params)
    respond_to do |format|
      if @society.save
        session[:society_id] = @society.id
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
      params.require(:society).permit(:name, :register_num, :website, :description, :logo, 
      joins_attributes: [:id, :role, :admin, :_destroy, member_attributes: [:id, :name, :email, :phone, :auto_generate]])
    end
end
