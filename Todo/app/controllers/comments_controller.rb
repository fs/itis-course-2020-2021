class CommentsController < ApplicationController
  def create
    task = Task.find(params[:task_id])
    @comment = task.comments.build(content: params[:content])

    set_flash_message

    redirect_to task_url(id: task)
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to task_url(id: @comment.task)
  end

  private

  def set_flash_message
    if @comment.save
      flash[:notice] = 'Comment was successfully created!'
    else
      flash[:alert] = @comment.errors.full_messages.join(', ')
    end
  end
end
