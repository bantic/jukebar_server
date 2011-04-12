class User < ActiveRecord::Base
  validates_uniqueness_of :name, :allow_nil => true
end
