class BarSong < ActiveRecord::Base
  belongs_to :bar, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  
  def vote!
    Pusher[self.bar.to_channel].trigger("vote-create", self.attributes)
    Vote.create!(:bar_song => self, :active => true)
  end
  
  def inactivate_votes!
    votes.active.all.each do |vote|
      vote.active = false
      vote.save!
    end
  end
end
