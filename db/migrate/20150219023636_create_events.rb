class CreateEvents < ActiveRecord::Migration
  def change
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
end
