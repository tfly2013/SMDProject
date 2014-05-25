class CommentsController < ApplicationController
  before_action :set_parents
  before_action :require_login
  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.member_id = current_member.id
    @comment.event_id = @event.id    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@society, @event] }
        format.json { render action: 'show', status: :created, location: [@society, @event] }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  
    def set_parents
      @society = Society.find(params[:society_id])
      @event = Event.find(params[:event_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
