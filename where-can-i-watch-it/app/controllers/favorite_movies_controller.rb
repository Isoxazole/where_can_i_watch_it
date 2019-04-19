class FavoriteMoviesController < ApplicationController

  
  def create
    @movie = Movie.find(params[:movie_id] || params[:id])
    if Favorite.create(favorited: @movie, user: current_user)
        @movie.favcounter += 1
        @movie.save
      redirect_to @movie, notice: '#{@movie.title} has been favorited'
    else
      redirect_to @movie, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    @movie = Movie.find(params[:movie_id] || params[:id])
    @movie.favcounter -= 1
    @movie.save
    Favorite.where(favorited_id: @movie.id, user_id: current_user.id).first.destroy
    redirect_to @movie, notice: '#{@movie.title} is no longer in favorites'
  end
  
  def favorites
  
    if params[:search]
        redirect_to movies_path(:search => params[:search])
    end
  
    @favorites = current_user.favorite_movies
  end
  
end