class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.movie_id = params[:movie_id]
    @comment.author_name = current_user.email.split("@")[0]

    @comment.save

    redirect_to movie_path(@comment.movie_id)
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment deleted."
    redirect_to movie_path(@movie)
  end
end
