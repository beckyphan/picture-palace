class CommentsController < ApplicationController
  before_action :authenticate_user!

    def create
      @comment = Comment.new(note: params[:comment][:note], event_id: params[:event_id], user_id: current_user.id)
      @event = Event.find_by_id(params[:event_id])

      @comment.save

      redirect_to event_path(@event)
    end

    def destroy
      @comment = Comment.find_by(event_id: params[:event_id], user_id: current_user.id)
      @comment.destroy
      flash[:notice] = "Your comment was deleted."
      redirect_to event_path(params[:event_id])
    end

end
