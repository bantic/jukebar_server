class Action < ActiveRecord::Base
  scope :playable, where(["action_type = ?", "play"])
  scope :unviewed, where(["viewed = ?", false])
  
  belongs_to :bar, :dependent => :destroy
  
  def reserve!
    self.viewed = true
    self.save!
  end
end
