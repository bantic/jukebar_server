class User < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :votes
  DEFAULT_CREDITS = 10
  
  before_save :default_values
  
  def can_vote?
    self.credits > 0
  end
  
  def vote(bar_song)
    Rails.logger.info("User #{self.name} voted for #{bar_song.name}")
    Pusher[bar_song.bar.to_channel].trigger("vote", bar_song.attributes)
    self.decrement!(:credits)
    Vote.create(:bar_song => bar_song, :active => true, :user => self)
  end
  
  def add_credits(number)
    self.increment!(:credits, number)
  end
  
  private
  
  def default_values
    self.credits ||= DEFAULT_CREDITS
  end
end
