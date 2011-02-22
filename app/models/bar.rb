class Bar < ActiveRecord::Base
  has_many :bar_songs
  has_many :actions, :order => "created_at ASC"
  belongs_to :bar_song
  
  def register!
    self.bar_songs.clear
  end
  
  def next_song
    # TODO this is stupidly inefficient #FIXME
    bar_song_votes = self.bar_songs.collect {|bs| [bs.id, bs.votes.active.count] }
    highest_vote_pair = bar_song_votes.sort {|a,b| b[1] <=> a[1]}.first
    if highest_vote_pair[1] == 0 # 0 votes
      {}
    else
      highest_song_id = highest_vote_pair[0]
      BarSong.find(highest_song_id)
    end
  end
  
  def set_status(action_type, *args)
    case action_type
    when /playing/
      self.status = "playing"
      if bar_song = BarSong.find_by_database_ID_and_bar_id(args[0], self.id)
        self.bar_song = bar_song
        self.bar_song.inactivate_votes!
      end
    when /paused/
      self.status = "paused"
      self.bar_song = nil
    end
    save!
  end
  
  def playing!(database_ID)
    set_status(:playing, database_ID)
  end
  
  def paused!
    set_status(:paused)
  end
  
end
