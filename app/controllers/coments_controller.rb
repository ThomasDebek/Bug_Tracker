class ComentsController < ApplicationController

  def create
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.build(comment_params)

    if @comment.save
      redirect_to @issue
    else
      redirect_to @issue, alert: "Comment cannot be empty"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
