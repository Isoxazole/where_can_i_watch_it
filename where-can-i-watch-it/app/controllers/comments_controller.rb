class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.movie_id = params[:movie_id]

    @comment.save

    redirect_to movie_path(@comment.movie)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
