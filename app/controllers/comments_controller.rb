class CommentsController < ApplicationController

    def index
    end

    def create
      @comment = Comment.new(note: params[:comment][:note], event_id: params[:event_id], user_id: current_user.id)
      @event = Event.find_by_id(params[:event_id])

      @comment.save

      redirect_to event_path(@event)
    end

    def new
    end

    def edit
    end

    def show
    end

    def update
    end

    def destroy
    end

end
