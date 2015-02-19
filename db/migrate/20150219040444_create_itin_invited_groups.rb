class CreateItinInvitedGroups < ActiveRecord::Migration
  def change
    create_table :itin_invited_groups do |t|
      t.belongs_to :itinerary
      t.belongs_to :group
      t.integer :privelege

      t.timestamps
    end
  end
end
