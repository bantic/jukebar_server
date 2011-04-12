class AddCreditsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :credits, :integer
  end

  def self.down
    remove_column :users, :credits
  end
end
