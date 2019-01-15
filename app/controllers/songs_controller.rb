class SongsController < ApplicationController
    before_action :song_find, only: [:show, :edit, :update]

    def index
        @songs = Song.all        
    end

    def show
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new
        @song.name = song_params(:name)
        @song.artist_id = Artist.find(song_params(:artist_id)[:artist_id]).id
        @song.genre_id = Genre.find(song_params(:genre_id)[:genre_id]).id
        #  byebug
        @song.save
        
        redirect_to song_path(@song)
    end

    def edit
    end

    def update
        @song.update(song_params(:name, :bio))

        redirect_to song_path(@song)
    end

    def song_params(*args)
        params.require(:song).permit(*args)
    end

    def song_find
        @song = Song.find(params[:id])
    end

end
