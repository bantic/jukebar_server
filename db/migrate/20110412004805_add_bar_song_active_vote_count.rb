class AddBarSongActiveVoteCount < ActiveRecord::Migration
  def self.up
    add_column :bar_songs, :active_vote_count, :integer, :default => 0
  end

  def self.down
    remove_column :bar_songs, :active_vote_count
  end
end
