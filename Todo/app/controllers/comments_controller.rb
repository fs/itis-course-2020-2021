class CommentsController < ApplicationController
  before_action :set_task, only: %i[edit update destroy show]

  def create
    @comment = @task.comments.build(content: params[:content])

    if @comment.save
      flash[:notice] = 'Comment was successfully created!'
    else
      flash[:alert] = @comment.errors.full_messages.join(', ')
    end

    redirect_to task_url(id: @task)
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to task_url(id: @comment.task)
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end
end
