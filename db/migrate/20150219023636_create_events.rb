class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :name
      t.belongs_to :itinerary, index: true
      t.string :description
      t.integer :duration
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.datetime :deadline_datetime

      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
