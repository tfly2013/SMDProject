class MessagesController < ApplicationController
  before_action :set_parents
  before_action :set_message, only: [:show, :destroy]
  before_action :require_login
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    if (current_member.id == @message.receiver.id)
      @message.read = true
      @message.save
    end
  end

  # GET /messages/new
  def new
    @member = Member.find(params[:member_id])
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.receiver_id = Member.find_by_email(params[:message][:receiver]).id
    @message.sender_id = current_member.id
    @message.read = false
    respond_to do |format|
      if @message.save
        format.html { redirect_to [@message.sender, @message] }
        format.json { render action: 'show', status: :created, location: [@message.sender, @message] }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to [@member, :messages] }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end
    
    def set_parents
      @member = Member.find(params[:member_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content)
    end
end
