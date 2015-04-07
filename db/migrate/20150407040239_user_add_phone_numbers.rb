class UserAddPhoneNumbers < ActiveRecord::Migration
  def change
  	add_column(:users, :work, :string, null: false, default: "")
  	add_column(:users, :cell, :string, null: false, default: "")
  end
end
