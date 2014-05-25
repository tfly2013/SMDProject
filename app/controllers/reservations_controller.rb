class ReservationsController < ApplicationController
  before_action :set_parents
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @society = Society.find(params[:society_id])
    @event = Event.find(params[:event_id])
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.event_id = params[:event_id]
    @reservation.member_id = current_member.id
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to [@reservation.event.society, @reservation.event, @reservation] }
        format.json { render action: 'show', status: :created, location: [@reservation.event.society, @reservation.event, @reservation] }
      else
        format.html { render action: 'new' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to [@reservation.event.society, @reservation.event, @reservation] }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to current_member }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])      
    end
    
    def set_parents
      @event = Event.find(params[:event_id])
      @society = Society.find(params[:society_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:member_id, :ticket_id, :quantity, :status)
    end
end
