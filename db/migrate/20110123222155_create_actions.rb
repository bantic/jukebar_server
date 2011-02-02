class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions do |t|
      t.string :action_type
      t.string :data
      t.boolean :viewed, :default => false
      t.references :bar

      t.timestamps
    end
  end

  def self.down
    drop_table :actions
  end
end
