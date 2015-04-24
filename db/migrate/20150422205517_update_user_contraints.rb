class UpdateUserContraints < ActiveRecord::Migration
  def change
  	change_column(:users, :name, :string, null: false, default: "no_name")
  	change_column(:users, :email, :string, null: false, default: "no_email")
  	change_column(:users, :title, :string, default: "")
  end
end