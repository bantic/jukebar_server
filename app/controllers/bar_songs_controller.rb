class BarSongsController < ApplicationController
  def create
    @bar = Bar.find_by_id(params[:bar_id])
    if @bar_song = @bar.bar_songs.find_by_database_ID(params[:bar_song][:database_ID])
      puts "Skipping extant song #{@bar_song.to_json}"
      ; # do nothing
    else
      @song = @bar.bar_songs.create!(params[:bar_song])
    end
    
    head :ok
  end
  
  def play
    @bar_song = BarSong.find(params[:id])
    @bar_song.play!
  end
end
