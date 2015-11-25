class PlaylistsController < ApplicationController

	before_action :set_playlist, only: [:show, :edit, :update, :destroy] 

	def index
		@playlists = Playlist.all
	end

	def new
		@playlist = Playlist.new
	end

	def show
	end

	def edit
	end

	def create
		@playlist = Playlist.new(playlist_params)
			respond_to do |format|
      if @playlist.save
        format.html { redirect_to @playlist, notice: 'video was successfully upload.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
	end

	def update
		respond_to do |format|
			if @playlist.update(playlist_params)
				format.html { redirect_to @playlist, notice: 'video was successfully updated.' }
	    end 
  	end
	end

	def destroy
		respond_to do |format|
			if @playlist.destroy
				format.html { redirect_to @playlist, notice: 'video was successfully updated.' }
	    end 
  	end
  end

	private

	def set_playlist
		@playlist = Playlist.friendly.find(params[:id])
	end

	def playlist_params
		params.require(:playlist).permit(:link, :video_title, :author, :likes, :dis_likes)
	end
end
