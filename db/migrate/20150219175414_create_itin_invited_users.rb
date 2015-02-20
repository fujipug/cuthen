class CreateItinInvitedUsers < ActiveRecord::Migration
  def up
    create_table :itin_invited_users do |t|
      t.belongs_to :itinerary, index: true
      t.belongs_to :user, index: true
      t.integer :privelege

      t.timestamps
    end
  end

  def down
  	drop_table :itin_invited_users
  end
end
