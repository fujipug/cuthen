class CreateEventInvitedGroups < ActiveRecord::Migration
  def up
    create_table :event_invited_groups do |t|
      t.belongs_to :event, index: true
      t.belongs_to :group, index: true

      t.timestamps
    end
  end

  def down
  	drop_table :event_invited_groups
  end
end
