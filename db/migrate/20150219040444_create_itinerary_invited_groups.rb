class CreateItineraryInvitedGroups < ActiveRecord::Migration
  def up
    create_table :itinerary_invited_groups do |t|
      t.belongs_to :itinerary
      t.belongs_to :group
      t.integer :privelege

      t.timestamps
    end
  end

	def down
  	drop_table :itinerary_invited_groups
  end
end
