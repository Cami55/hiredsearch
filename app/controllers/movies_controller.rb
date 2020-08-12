class MoviesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        movies.title ILIKE :query \
        OR movies.syllabus ILIKE :query \
        OR directors.first_name ILIKE :query \
        OR directors.last_name ILIKE :query \
      "
      @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
