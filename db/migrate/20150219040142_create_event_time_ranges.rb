class CreateEventTimeRanges < ActiveRecord::Migration
  def change
    create_table :event_time_ranges do |t|
      t.belongs_to :event, index: true
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
  end
end
