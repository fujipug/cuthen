class CreateUserEventVotes < ActiveRecord::Migration
  def change
    create_table :user_event_votes do |t|
      t.belongs_to :user
      t.belongs_to :event, index: true
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
  end
end
