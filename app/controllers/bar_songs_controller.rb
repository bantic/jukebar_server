class BarSongsController < ApplicationController
  before_filter :load_bar
  respond_to :json, :only => [:index]
  
  # API method
  def create
    if @bar_song = @bar.bar_songs.find_by_database_ID(params[:bar_song][:database_ID])
      puts "Skipping extant song #{@bar_song.to_json}"
      ; # do nothing
    else
      @song = @bar.bar_songs.create!(params[:bar_song])
    end
    
    head :ok
  end
  
  def index
    @songs = @bar.bar_songs
    respond_with(@songs)
  end
  
  def vote
    @bar_song = BarSong.find(params[:id])
    @bar_song.vote!
    head :created
  end
  
  private
  
  def load_bar
    @bar = Bar.find(params[:bar_id])
  end
end