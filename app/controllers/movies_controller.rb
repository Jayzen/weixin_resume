class MoviesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_movies, only: [:index]
  #access movie: :all, message: "当前用户无权访问"

  def index
  end

  def show
  end

  def new
    @movie = current_user.movies.new
  end

  def edit
  end

  def create
    @movie = current_user.movies.new(movie_params)

    if @movie.save
      flash[:success] = "创建成功"
      redirect_to movies_path
    else
      render :new
    end
  end
  
  def update
    if @movie.update(movie_params)
      flash[:success] = "更新成功"
      redirect_to movies_path
    else
      render :edit
    end
  end


  def delete
  end

  def destroy
    @movie.destroy
    flash[:success] = "删除成功"
    redirect_to movies_path
  end

  private
    def set_movie
      @movie = current_user.movies.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :content, :movie, :reveal)
    end

    def set_movies
      @movies = current_user.movies.page(params[:page])
    end
end
