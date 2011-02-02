class CreateBarSongs < ActiveRecord::Migration
  def self.up
    create_table :bar_songs do |t|
      t.string :name
      t.string :artist
      t.integer :database_ID
      t.references :bar

      t.timestamps
    end
  end

  def self.down
    drop_table :bar_songs
  end
end
