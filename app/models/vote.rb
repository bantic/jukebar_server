class Vote < ActiveRecord::Base
  belongs_to :bar_song, :dependent => :destroy
  
  scope :active, {:conditions => {:active => true}}
end
