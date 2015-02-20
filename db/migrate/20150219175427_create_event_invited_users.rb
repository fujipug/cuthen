class CreateEventInvitedUsers < ActiveRecord::Migration
  def up
    create_table :event_invited_users do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.boolean :responded, default:false
      t.integer :privelege

      t.timestamps
    end
  end

  def down
  	drop_table :event_invited_users
  end
end
