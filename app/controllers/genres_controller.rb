class GenresController < ApplicationController
    before_action :genre_find, only: [:show, :edit, :update]

    def index
        @genres = Genre.all        
    end

    def show
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.create(genre_params(:name))
        
        redirect_to genre_path(@genre)
    end

    def edit
    end

    def update
        @genre.update(genre_params(:name))

        redirect_to genre_path(@genre)
    end

    def genre_params(*args)
        params.require(:genre).permit(*args)
    end

    def genre_find
        @genre = Genre.find(params[:id])
    end
end
