class BarSong < ActiveRecord::Base
  belongs_to :bar
  
  def play!
    Action.create!(:action_type => "play", :data => self.database_ID)
  end
end
