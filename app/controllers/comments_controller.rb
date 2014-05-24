class CommentsController < ApplicationController

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        gflash :now,  :notice => 'Comment was successfully created.'
        format.html { redirect_to [@society, @event] }
        format.json { render action: 'show', status: :created, location: [@society, @event] }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:member_id, :event_id, :content)
    end
end
