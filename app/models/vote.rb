class Vote < ActiveRecord::Base
  belongs_to :bar_song, :dependent => :destroy
  
  scope :active, {:conditions => {:active => true}}
  
  after_create :update_bar_song
  
  private
  
  def update_bar_song
    if self.active
      BarSong.update_counters(self.bar_song_id, {:active_vote_count => 1})
    end
    true
  end
end
