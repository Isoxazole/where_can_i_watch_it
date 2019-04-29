class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date, :favcounter)
  end

  def show
     if params[:search]
        redirect_to movies_path(:search => params[:search])
    end
  
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    @comment = Comment.new
    @comment.movie_id = id

    # will render app/views/movies/show.<extension> by default
  end

  def index
    
    if clear_filters?
        params[:search] = nil
        session[:search_movie] = nil
        params[:ratings] = nil
        session[:ratings] = nil
        
    end
    
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
      redirect_to movies_path(:ratings=>@ratings, :search_movie => @search_movie)

    end

    if @ratings
      @movies = Movie.where(:rating => @ratings.keys)
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
  
  def popular
  
    if params[:search]
        redirect_to movies_path(:search => params[:search])
    end
    
    @movies = Movie.all
    
    @movies = Movie.order('favcounter DESC')   
  end
  
  def recent_releases
  
  if params[:search]
        redirect_to movies_path(:search => params[:search])
    end
  
  @movies = Movie.all
   
  time_range = 14
  
  @movies = Movie.where("release_date >= ?", (Date.today - time_range))
  
  end

  def clear_filters?
    params[:commit] == "Clear"
  end

end
