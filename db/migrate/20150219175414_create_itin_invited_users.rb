class CreateItinInvitedUsers < ActiveRecord::Migration
  def change
    create_table :itin_invited_users do |t|
      t.belongs_to :itinerary, index: true
      t.belongs_to :user, index: true
      t.integer :privelege

      t.timestamps
    end
  end
end
