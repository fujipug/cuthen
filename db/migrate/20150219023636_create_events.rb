class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :name
      t.belongs_to :itinerary, index: true
      t.integer :duration
      t.datetime :starttime
      t.datetime :endtime
      t.datetime :deadline

      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
