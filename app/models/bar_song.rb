class BarSong < ActiveRecord::Base
  belongs_to :bar, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  
  def inactivate_votes!
    votes.active.all.each do |vote|
      vote.active = false
      vote.save!
    end
    self.active_vote_count = 0
    save!
  end
end
