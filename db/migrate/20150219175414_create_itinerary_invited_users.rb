class CreateItineraryInvitedUsers < ActiveRecord::Migration
  def up
    create_table :itinerary_invited_users do |t|
      t.belongs_to :itinerary, index: true
      t.belongs_to :user, index: true
      t.integer :privelege

      t.timestamps
    end
  end

  def down
  	drop_table :itinerary_invited_users
  end
end
