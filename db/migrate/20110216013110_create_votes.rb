class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :bar_song_id
      t.integer :user_id
      t.boolean :active
      
      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
