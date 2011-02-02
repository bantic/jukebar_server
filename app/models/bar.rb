class Bar < ActiveRecord::Base
  has_many :bar_songs
  
  def register!
    Action.create!(:action_type => "register_bar", :data => self.id)
  end
end
