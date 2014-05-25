class EventsController < ApplicationController
  before_action :set_parents
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    3.times { @event.pictures.build }
    @event.build_group
    @event.build_ticket
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.society_id = params[:society_id]
    respond_to do |format|
      if @event.save   
        format.html { redirect_to [@event.society, @event] }
        format.json { render action: 'show', status: :created, location: [@event.society, @event] }
      else
        3.times { @event.pictures.build }
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to [@event.society, @event] }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to [@society,:events] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])      
    end
    
    def set_parents
      @society = Society.find(params[:society_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :type, :date_begin, :time_begin, :date_end, :time_end, 
      :location, :website, :description, group_attributes: [:id,:name,:societylist], 
      pictures_attributes: [:id, :picture], ticket_attributes: [:id, :total, :price])
    end
end
