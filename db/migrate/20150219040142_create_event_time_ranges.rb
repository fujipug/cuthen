class CreateEventTimeRanges < ActiveRecord::Migration
  def up
    create_table :event_time_ranges do |t|
      t.belongs_to :event, index: true
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
  end

  def down
  	drop_table :event_time_ranges
  end
end
