class Bar < ActiveRecord::Base
  has_many :bar_songs
  has_many :actions, :order => "created_at ASC"
  
  def register!
    self.bar_songs.clear
    Action.create!(:action_type => "register_bar", :data => self.id, :bar => self)
  end
  
  def reserve_actions
    if action = self.actions.playable.unviewed.first
      action.reserve!
      [action]
    else
      []
    end
  end
end
