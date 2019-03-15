class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    @movies = Movie.search(@search_movie)
    @all_ratings = Movie.all_ratings
    redirect = false

    if params[:search]
      @search_movie = params[:search]
      session[:search_movie] = params[:search]
    elsif session[:search_movie]
      @search_movie = session[:search_movie]

    else
      @search_movie = nil
    end


    if params[:sort_by] #check if there's any new params
      @sort_by = params[:sort_by]
      session[:sort_by] = params[:sort_by]
    elsif session[:sort_by] #if no new params, use saved in session
      @sort_by = session[:sort_by]
      redirect = true
    else
      @sort_by = nil
    end

    if params[:ratings]
      @ratings = params[:ratings]
      session[:ratings] = params[:ratings]
    elsif session[:ratings]
      @ratings = session[:ratings]
      redirect = true
    else
      @ratings = nil
    end

    if redirect
      flash.keep
      redirect_to movies_path(:sort_by=>@sort_by, :ratings=>@ratings, :search_movie => @search_movie)

    end

    if @ratings and @sort_by
      @movies = Movie.where(:rating => @ratings.keys).order(@sort_by)
    elsif @ratings
      @movies = Movie.where(:rating => @ratings.keys)
    elsif @sort_by
      @movies = Movie.all.order(@sort_by)
    else
      @movies = Movie.all
    end

    if @search_movie
      @movies = @movies.search(@search_movie)
    end

    unless @ratings
      @ratings = Hash.new
    end

  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
