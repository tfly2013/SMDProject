class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
    
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    3.times { @event.pictures.build }
    @event.groups.build
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.saved
        gflash :now,  :notice => 'Event was successfully created.'
        format.html { redirect_to @event }
        format.json { render action: 'show', status: :created, location: @event }
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
        gflash :now,  :notice => 'Event was successfully updated.'
        format.html { redirect_to @event }
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
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :type, :begin_time, :end_time, 
      :location, :webpage, :description, :societylist, event_groups_attributes: [:id], pictures_attributes: [:id, :picture])
    end
end
