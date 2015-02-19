class CreateEventInvitedGroups < ActiveRecord::Migration
  def change
    create_table :event_invited_groups do |t|
      t.belongs_to :event, index: true
      t.belongs_to :group, index: true

      t.timestamps
    end
  end
end
